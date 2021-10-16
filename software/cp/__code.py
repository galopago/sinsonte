"""
CircuitPython single MP3 playback example for Raspberry Pi Pico.
Plays a single MP3 once.
"""
import board
import digitalio
import time

poweroff_gpio = board.GP14

poweroff = digitalio.DigitalInOut(poweroff_gpio)
poweroff.direction = digitalio.Direction.OUTPUT
poweroff.value = False

led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT
led.value = True

time.sleep(2)
print("Done playing!")

led.value = False

poweroff.value = True
poweroff.direction = digitalio.Direction.INPUT

while True:
    pass
