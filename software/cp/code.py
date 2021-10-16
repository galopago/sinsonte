"""
CircuitPython single MP3 playback example for Raspberry Pi Pico.
Plays a single MP3 once.
"""
import board
import digitalio
import audiomp3
import audiopwmio
import os
#import storage

poweroff_gpio = board.GP14
audio_gpio = board.GP28_A2
next_hour_file = 'nexthour.conf'
default_next_hour = '1'

# Do this ASAP!

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
	if next_hour in ['1','2','3','4','5','6','7','8','9','10','11','12'] :
		print("Valid value:",next_hour)
	else:
		print("Invalid value:",next_hour)
		# no valid value
		# Writting default value to config file
		#fp = open(next_hour_file,'w')
		#fp.write(default_next_hour+'\n')
		#fp.close()	
else:
	print("config file not found!, creating one:",next_hour_file)
	# Creating config file with default value
	#fp = open(next_hour_file,'w')
	#fp.write(default_next_hour+'\n')
	#fp.close()
		
#fp = open(next_hour_file,'w')
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
