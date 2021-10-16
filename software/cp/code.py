"""
CircuitPython single MP3 playback example for Raspberry Pi Pico.
Plays a single MP3 once.
"""
import board
import audiomp3
import audiopwmio
import digitalio
import os

poweroff_gpio = board.GP14
audio_gpio = board.GP28_A2
next_hour_file = 'nexthour.conf'
default_next_hour = '1'

poweroff = digitalio.DigitalInOut(poweroff_gpio)
poweroff.direction = digitalio.Direction.OUTPUT
poweroff.value = False


led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT
led.value = True

audio = audiopwmio.PWMAudioOut(audio_gpio)

print("Reading next hour file")
flist=os.listdir()
if next_hour_file in flist:
	print("config file found!:",next_hour_file)
	fp = open(next_hour_file,'r')
	next_hour = fp.readline().rstrip('\n')
	fp.close()
	# Search for valid values			
	print("value read from file:",next_hour)
	# no valid value
	# Writting default value to config file
	
else:
	print("config file not found!, creating one:",next_hour_file)
	# Creating config file with default value
	
#next_hour='12'

if next_hour == '12' :
	print("playing sound 12")
	decoder = audiomp3.MP3Decoder(open("12.mp3", "rb"))

if next_hour == '1' :
	print("playing sound 1")
	decoder = audiomp3.MP3Decoder(open("1.mp3", "rb"))

audio.play(decoder)
while audio.playing:
    pass

print("Done playing!")

led.value = False

poweroff.value = True
poweroff.direction = digitalio.Direction.INPUT

while True:
    pass
