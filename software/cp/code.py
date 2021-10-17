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

audio.play(decoder)

while audio.playing:
    pass

#Updating next hour to NVM
if next_hour < 12 :
	next_hour = next_hour +1
	microcontroller.nvm[0]=next_hour
else :
	microcontroller.nvm[0]=1

print("Done playing!")

led.value = False

poweroff.value = True
poweroff.direction = digitalio.Direction.INPUT

while True:
    pass
