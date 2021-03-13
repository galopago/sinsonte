#include <stdio.h>
#include "pico/stdlib.h"   // stdlib 
#include "hardware/irq.h"  // interrupts
#include "hardware/pwm.h"  // pwm 
#include "hardware/gpio.h" // gpio push-button 
#include "hardware/sync.h" // wait for interrupt 
#include "hardware/flash.h" // read/store from flash

 
// Audio PIN is to match some of the design guide shields. 
#define AUDIO_PIN 28  // you can change this to whatever you like


#define LED 	25 	// Onboard debug led
#define POWERON 14  // Poweron/poweroff pin (via external mosfet)


/* 
 * This include brings in static arrays which contain audio samples. 
 * if you want to know how to make these please see the python code
 * for converting audio samples into static arrays. 
 */

#include "12.h"
#include "1.h"
#include "2.h"
#include "3.h"
#include "4.h"
#include "5.h"

int wav_position = 0;
uint8_t hour_count = 0;
bool play_sound = 0;
bool flash_updated = 0;
const uint8_t * wav_data;
uint8_t flash_buff[FLASH_PAGE_SIZE];
uint32_t wav_data_length;

const uint8_t * flash_storage_r = (const uint8_t *) (XIP_BASE+(FLASH_SECTOR_SIZE*511));		// first byte of last sector of flash
const uint8_t * flash_storage_w = (const uint8_t *) (FLASH_SECTOR_SIZE*511);

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
			pwm_set_gpio_level(AUDIO_PIN, wav_data[wav_position>>3]);  
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
	
	gpio_init(POWERON);
	gpio_set_dir(POWERON,GPIO_OUT);
	gpio_put(POWERON,1);
		
	// read actual hour data from flash!
	
	if(flash_storage_r[0]>11)
	{
		hour_count = 0;
	}
	else
	{
		hour_count = flash_storage_r[0];
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
	
	// start playing sound
	
    play_sound = 1;
	pwm_set_gpio_level(AUDIO_PIN, 0);							


    while(1) {
      			if(play_sound == 0)
      			{      				      				
					//disable pwm interupts, store to flash and self power off!!
					irq_set_enabled(PWM_IRQ_WRAP, false);			      				
								    						
					// calculate next hour
					if(hour_count>4)
					{hour_count=0;}
					else
					{hour_count++;}
					
					//store hour to flash
					flash_buff[0]=hour_count;
					if (flash_updated == 0 )													
					{
						flash_updated = 1;
						flash_range_erase((uint32_t)flash_storage_w,FLASH_SECTOR_SIZE);
						flash_range_program((uint32_t)flash_storage_w,flash_buff,FLASH_PAGE_SIZE);
					}
					
					// Shut down I/O								
					gpio_put(POWERON,0);
						
					while(1)
					{sleep_us(1);}						
      			}
    			else
    			{
    				sleep_us(1);
    			}        		
    		}	
}