"""
***************************************************************************************
MP3 audio player based on Rpi Pico
audio data is stored in onboard flash filesystem Up to 800 KB of sound capacity
plays one clip of sound (random) on every power on
and uses external circuit for very low power 
***************************************************************************************
"""
import board
import digitalio
import analogio
import audiomp3
import audiopwmio
import os
import pwmio
import microcontroller
import random

"""
*****************************************************
TEPT5700 sensor with 10K resistor aprox ADC readings
*****************************************************
LUX(MS6610)    RAW		    VOLT

  48			0x0a8		0.135352
  33			0x070		0.090234
  21			0x054		0.067676
  14			0x03b		0.047534
   7			0x033		0.041089
   6			0x029		0.033032
   5			0x031		0.039478
   4			0x026		0.030615
"""
light_sensor_threshold = 0.030615 
analog_gpio = board.GP26_A0
poweroff_gpio = board.GP14
audio_gpio = board.GP28_A2
ext_led_gpio = board.GP10
default_next_hour = 1
night_time = 0
NUMBER_OF_FILES=12

# Do this ASAP! to keep board powered on

poweroff = digitalio.DigitalInOut(poweroff_gpio)
poweroff.direction = digitalio.Direction.OUTPUT
poweroff.value = False

led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT
led.value = True

light_sensor = analogio.AnalogIn(analog_gpio)
audio = audiopwmio.PWMAudioOut(audio_gpio)

#Generating random number to know which file to play
internal_adc_value=microcontroller.cpu.temperature
float_adc_value = 10000 * internal_adc_value
int_adc_value = int(float_adc_value)

random.seed(int_adc_value)
random_number=random.randint(1,NUMBER_OF_FILES)
print("float adc",float_adc_value)
print("int adc",int_adc_value)
print("random number",random_number)
next_hour=random_number;
	
# Check light sensor to know if it's night time
raw_adc = light_sensor.value
light_voltage = ( raw_adc / 65535	) * light_sensor.reference_voltage
print("raw adc",raw_adc)
print("light voltage",light_voltage)

if light_voltage < light_sensor_threshold :
	night_time = 1
	print("it's nightime!")
else :	
	night_time = 0
	print("it's daytime!")
	
if next_hour == 1 :
	print("playing sound 1")
	decoder = audiomp3.MP3Decoder(open("1.mp3", "rb"))

if next_hour == 2 :
	print("playing sound 2")
	decoder = audiomp3.MP3Decoder(open("2.mp3", "rb"))

if next_hour == 3 :
	print("playing sound 3")
	decoder = audiomp3.MP3Decoder(open("3.mp3", "rb"))

if next_hour == 4 :
	print("playing sound 4")
	decoder = audiomp3.MP3Decoder(open("4.mp3", "rb"))

if next_hour == 5 :
	print("playing sound 5")
	decoder = audiomp3.MP3Decoder(open("5.mp3", "rb"))

if next_hour == 6 :
	print("playing sound 6")
	decoder = audiomp3.MP3Decoder(open("6.mp3", "rb"))

if next_hour == 7 :
	print("playing sound 7")
	decoder = audiomp3.MP3Decoder(open("7.mp3", "rb"))

if next_hour == 8 :
	print("playing sound 8")
	decoder = audiomp3.MP3Decoder(open("8.mp3", "rb"))

if next_hour == 9 :
	print("playing sound 9")
	decoder = audiomp3.MP3Decoder(open("9.mp3", "rb"))

if next_hour == 10 :
	print("playing sound 10")
	decoder = audiomp3.MP3Decoder(open("10.mp3", "rb"))

if next_hour == 11 :
	print("playing sound 11")
	decoder = audiomp3.MP3Decoder(open("11.mp3", "rb"))

if next_hour == 12 :
	print("playing sound 12")
	decoder = audiomp3.MP3Decoder(open("12.mp3", "rb"))

#Only play sounds on DayLight

blink_led=pwmio.PWMOut(ext_led_gpio,duty_cycle=50,frequency=1,variable_frequency=False)	
if 	night_time == 0 :
	audio.play(decoder)

while audio.playing:
    pass

print("Done playing!")

blink_led.duty_cycle=0
led.value = False

poweroff.value = True
poweroff.direction = digitalio.Direction.INPUT

#Just stop here
while True:
    pass
