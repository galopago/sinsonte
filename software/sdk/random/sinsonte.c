// ***************************************************************************************
// WAV audio player based on Rpi Pico
// audio data is stored in onboard flash Up to 24 seconds in total of 8 bit mono wav sounds @44 KHz
// plays one (random) clip of sound on every power on
// and uses external circuit for very low power 
// ***************************************************************************************

#include <stdio.h>
#include <stdlib.h>
#include "pico/stdlib.h"   // stdlib 
#include "hardware/irq.h"  // interrupts
#include "hardware/pwm.h"  // pwm 
#include "hardware/gpio.h" // gpio push-button 
#include "hardware/sync.h" // wait for interrupt 
#include "hardware/adc.h" // analog light sensor
#include "hardware/uart.h" // analog light sensor

 
// Audio PIN is to match some of the design guide shields. 
#define AUDIO_PIN 28  // you can change this to whatever you like


#define LED 		   		25	// Onboard debug led
#define LED_EXTERNAL   		10	// External led
#define POWERON 	   		14	// Poweron/poweroff pin (via external mosfet)
#define LIGHTSENSOR    		26	// analog light sensor to detect nightime
#define ADC_INPUT_LIGHT 	 0	// analog light sensor to detect nightime
#define UART_ID 		 uart0  // UART0 is used by printf()
#define BAUD_RATE  		115200
#define UART_TX_PIN 		 0
#define UART_RX_PIN 		 1

#define MAX_SOUND_FILES		12

/* 
 * This includes brings in static arrays which contain audio samples. 
 * if you want to know how to make these please see the python code
 * for converting audio samples into static arrays. 
 */

/* Clock example: 12 sounds, 1 sound per hour. Each sound ~2 sec play*/

#include "12.h"
#include "1.h"
#include "2.h"
#include "3.h"
#include "4.h"
#include "5.h"
#include "6.h"
#include "7.h"
#include "8.h"
#include "9.h"
#include "10.h"
#include "11.h"

// *****************************************************
// TEPT5700 sensor with 10K resistor aprox ADC readings
// *****************************************************
// LUX(MS6610)    RAW		    VOLT
//
//  48			0x0a8		0.135352
//  33			0x070		0.090234
//  21			0x054		0.067676
//  14			0x03b		0.047534
//   7			0x033		0.041089
//   6			0x029		0.033032
//   5			0x031		0.039478
//   4			0x026		0.030615
   
const float ADC_CONV_FACTOR = 3.3f / (1<<12);
const float LIGHT_SENSOR_THRESHOLD = 0.030615 ;
bool nightime = 0;

int wav_position = 0;
uint8_t hour_count = 0;
bool play_sound = 0;
bool flash_updated = 0;
const uint8_t * wav_data;
uint32_t wav_data_length;


/*
 * PWM Interrupt Handler which outputs PWM level and advances the 
 * current sample. 
 * 
 * We repeat the same value for 8 cycles this means sample rate etc
 * adjust by factor of 8   (this is what bitshifting <<3 is doing)
 * 
 */
void pwm_interrupt_handler() {
    pwm_clear_irq(pwm_gpio_to_slice_num(AUDIO_PIN));    
    // set pwm level 
    // allow the pwm value to repeat for 8 cycles this is >>3 
    
    if (wav_position < (wav_data_length<<3) - 1) {
    		if(nightime==1) 
    			{
    				pwm_set_gpio_level(AUDIO_PIN, 0);  
    			}
    		else
    			{	
					pwm_set_gpio_level(AUDIO_PIN, wav_data[wav_position>>3]);  
					
					// External led blink with sound
					if( wav_data[wav_position>>3] > 128 )
					{
						gpio_put(LED_EXTERNAL,1);
					}
					else
					{
						gpio_put(LED_EXTERNAL,0);
					}
				}
			wav_position++;         						
		}
	else
		{			
			wav_position = 0;
			play_sound = 0;
		}	        
}


int main(void) {

	wav_data = (const uint8_t *)  &WAV_DATA_12;
	wav_data_length = WAV_DATA_12_LENGTH;

    /* Overclocking for fun but then also so the system clock is a 
     * multiple of typical audio sampling rates.
     */
    stdio_init_all();
    set_sys_clock_khz(176000, true); 
    gpio_set_function(AUDIO_PIN, GPIO_FUNC_PWM);

    int audio_pin_slice = pwm_gpio_to_slice_num(AUDIO_PIN);

    // Setup PWM interrupt to fire when PWM cycle is complete
    pwm_clear_irq(audio_pin_slice);
    pwm_set_irq_enabled(audio_pin_slice, true);
    // set the handle function above
    irq_set_exclusive_handler(PWM_IRQ_WRAP, pwm_interrupt_handler); 
    irq_set_enabled(PWM_IRQ_WRAP, true);

    // Setup PWM for audio output
    pwm_config config = pwm_get_default_config();
    /* Base clock 176,000,000 Hz divide by wrap 250 then the clock divider further divides
     * to set the interrupt rate. 
     * 
     * 11 KHz is fine for speech. Phone lines generally sample at 8 KHz
     * 
     * 
     * So clkdiv should be as follows for given sample rate
     *  8.0f for 11 KHz
     *  4.0f for 22 KHz
     *  2.0f for 44 KHz etc
     */
    pwm_config_set_clkdiv(&config, 2.0f); 
    pwm_config_set_wrap(&config, 250); 
    pwm_init(audio_pin_slice, &config, true);

	//gpio POWER PIN init
	gpio_init(LED);
	gpio_set_dir(LED,GPIO_OUT);
	gpio_put(LED,1);

	gpio_init(LED_EXTERNAL);
	gpio_set_dir(LED_EXTERNAL,GPIO_OUT);
	gpio_put(LED_EXTERNAL,0);
	
	gpio_init(POWERON);
	gpio_set_dir(POWERON,GPIO_OUT);
	gpio_put(POWERON,0);

	//UART for debug setup
    uart_init(UART_ID, BAUD_RATE);
    gpio_set_function(UART_TX_PIN, GPIO_FUNC_UART);
    gpio_set_function(UART_RX_PIN, GPIO_FUNC_UART);
    
	// Init adc and check light sensor (nightime!)		
	adc_init();	
	adc_gpio_init(LIGHTSENSOR);
	adc_select_input(ADC_INPUT_LIGHT);
	uint16_t adcresult=adc_read();

	// Init adc internal temperature sensor, as a seed for random
	adc_set_temp_sensor_enabled(true);
	adc_select_input(4);
	uint16_t tempsensorint=adc_read();
	// Get random number to know which file to play
	srand(tempsensorint);
	hour_count=(rand()%(MAX_SOUND_FILES-1))+1;
	
	//printf("Raw:0x%03x,Volt:%f V\n",adcresult,adcresult * adc_conv_factor);
    			        
	if(adcresult * ADC_CONV_FACTOR < LIGHT_SENSOR_THRESHOLD )
		{
			nightime=1;
		}
	else
		{
			nightime=0;	
		}
			
	
	// select wav data sound according to hour
	
	if(hour_count==0)
	{
		wav_data = (const uint8_t *) &WAV_DATA_12;
		wav_data_length = WAV_DATA_12_LENGTH;
	}
	if(hour_count==1)
	{
		wav_data = (const uint8_t *) &WAV_DATA_1;
		wav_data_length = WAV_DATA_1_LENGTH;
	}
	if(hour_count==2)
	{
		wav_data = (const uint8_t *) &WAV_DATA_2;
		wav_data_length = WAV_DATA_2_LENGTH;
	}
	if(hour_count==3)
	{
		wav_data = (const uint8_t *) &WAV_DATA_3;
		wav_data_length = WAV_DATA_3_LENGTH;
	}
	if(hour_count==4)
	{
		wav_data = (const uint8_t *) &WAV_DATA_4;
		wav_data_length = WAV_DATA_4_LENGTH;
	}
	if(hour_count==5)
	{
		wav_data = (const uint8_t *) &WAV_DATA_5;
		wav_data_length = WAV_DATA_5_LENGTH;
	}
	if(hour_count==6)
	{
		wav_data = (const uint8_t *) &WAV_DATA_6;
		wav_data_length = WAV_DATA_6_LENGTH;
	}
	if(hour_count==7)
	{
		wav_data = (const uint8_t *) &WAV_DATA_7;
		wav_data_length = WAV_DATA_7_LENGTH;
	}
	if(hour_count==8)
	{
		wav_data = (const uint8_t *) &WAV_DATA_8;
		wav_data_length = WAV_DATA_8_LENGTH;
	}
	if(hour_count==9)
	{
		wav_data = (const uint8_t *) &WAV_DATA_9;
		wav_data_length = WAV_DATA_9_LENGTH;
	}
	if(hour_count==10)
	{
		wav_data = (const uint8_t *) &WAV_DATA_10;
		wav_data_length = WAV_DATA_10_LENGTH;
	}
	if(hour_count==11)
	{
		wav_data = (const uint8_t *) &WAV_DATA_11;
		wav_data_length = WAV_DATA_11_LENGTH;
	}
	
	// start playing sound
	
    play_sound = 1;
	pwm_set_gpio_level(AUDIO_PIN, 0);							


    while(1) {
      			if(play_sound == 0)
      			{      				      				
					//disable pwm interupts, store to flash and self power off!!
					irq_set_enabled(PWM_IRQ_WRAP, false);			      				
								    										
					
					// Shut down I/O								
					gpio_put(POWERON,1);
						
					while(1)
					{sleep_us(1);}						
      			}
    			else
    			{
    				// doing "someting" between sound samples interrupts
    				sleep_us(1);
    			}        		
    		}	
}
