"""
CircuitPython single MP3 playback example for Raspberry Pi Pico.
Plays a single MP3 once.
"""
import board
import digitalio
import audiomp3
import audiopwmio
import os
import microcontroller


poweroff_gpio = board.GP14
audio_gpio = board.GP28_A2
next_hour_file = 'nexthour.conf'
default_next_hour = 1

# Do this ASAP!

poweroff = digitalio.DigitalInOut(poweroff_gpio)
poweroff.direction = digitalio.Direction.OUTPUT
poweroff.value = False

led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT
led.value = True

audio = audiopwmio.PWMAudioOut(audio_gpio)

#Reading next hour from NVM
next_hour=microcontroller.nvm[0];
print("Next hour from NVM:",next_hour)
#check for a valid value
if next_hour >0 and next_hour<13  :
	print("Next hour from NVM value ok:",next_hour)
else :
	print("Next hour from NVM value invalid:",next_hour)
	microcontroller.nvm[0]=default_next_hour
	next_hour=microcontroller.nvm[0];
	print("Next hour from NVM changed to:",next_hour)

next_hour = '1'

if next_hour == '12' :
	print("playing sound 12")
	decoder = audiomp3.MP3Decoder(open("12.mp3", "rb"))
	#fp.write('1\n')

if next_hour == '1' :
	print("playing sound 1")
	decoder = audiomp3.MP3Decoder(open("1.mp3", "rb"))
	#fp.write('12\n')

#fp.close()
#storage.remount("/",readonly=True)

audio.play(decoder)
while audio.playing:
    pass

print("Done playing!")

led.value = False

poweroff.value = True
poweroff.direction = digitalio.Direction.INPUT

while True:
    pass
