# SOUND PLAYER BASED ON RPI PICO

Sound player based on Raspberry Rpi Pico. Sound data are stored in onboard memory. Very few external (easy to find & solder) components required. The project was designed to be in sleep mode for a very long time powered by batteries. Can be used for musical wall clocks, talking dolls, toys, etc.

![BOARD](/docs/sinsonte.png)

Printed circuit board with all components soldered.

Also read this in other languages: [Espanol](/docs/README.es.md)

## Working principle

The circuit ([see schematic](/docs/schematic.pdf)) has been designed to stay most of the time in silence powered by 2 AA batteries, like musical wall clocks or talking toys. In the best scenario, Rpi Pico in in deep sleep mode, will drain approx 1.3 mAh from the batteries. A pair of AA batteries in series have around 2000 mAh of juice, just in standby they will last only for two months. Unacceptable!.

An external circuit was added to totally power off Rpi Pico via 3V3_EN pin. Draining just only 70 uAh, which translates to 3 years of standby. Much better!

The circuit work in the following manner: In standby mode, a capacitor with a large resistor holds the conduction voltage of a MOSFET which is in charge of tying 3V3_EN to ground, powering off the board completely. To play a sound, click briefly on the push button which discharges the capacitor and stops conduction of the MOSFET. Now 3V3_EN pin is tied to V+ via its internal pull up, powering on the Rpi Pico Board. Once powered on and program booted, it keeps the capacitor discharged via a GPIO while sound is played. When the sound ends, the RPI Pico puts the GPIO in high impedance state, so the capacitor charges again and Rpi Powers off until the next click on the button!

There are many stored sounds in the Rpi Pico, and they are played in sequence. To know which sound needs to be played in the next click, some data needs to be preserved between power offs, that data is stored in the internal flash memory. Be careful modifying the program to keep flash writes to a minimum.

The program was written using the Rpi Pico SDK and more or less the same functionality also in CircuitPython too!


## Directory structure

Hardware folder contains schematic and printed circuit board.
* /hardware/ folder contains KiCad V5.1 project
* /hardware/gerber folder contains ready to manufacture files.
* /hardware/modules folder contains additional footprints needed to edit printed circuit board.
* /hardware/library folder contains additional symbols needed to edit schematic.

Software folder contains program source code.
* /software/sdk folder contains C source code for multiple apps develped with the Raspberry **Pi Pico SDK**.
* /software/sdk/utils folder contain additional python scripts.
* /software/sdk/uf2_binaries folder contains compiled programs ready for download to the Rpi Pico.
* /software/sdk/sounds folder contains sound files source in form of C arrays[].
* /software/sdk/build folder will contain downloadable binaries once compiled.
* /software/cp folder contains Python source code for multiple apps develped with **CircuitPython**.
* /software/cp/_sounds folder contains sound files source in .mp3 format
* /software/cp/_utils folder contains contains binary files

Docs folder contains additional info files

# C/C++ SDK
## How to use this repository

This is a very brief guide how to install Rpi Pico SDK on Linux (Ubuntu!). For more info please visit [official repo](https://github.com/raspberrypi/pico-sdk)
~~~
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
git clone -b master https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git submodule update --init
~~~
Add the line below to .bashrc file, and then restart session to allow changes to take effect.
~~~
export PICO_SDK_PATH={sdk path}/pico-sdk
~~~
Clone project repository
~~~
git clone https://github.com/galopago/SINSONTE.git
~~~
* Modify /SINSONTE/software/sdk/CMakeLists.txt file change Rpi Pico SDK paths with your own installation paths.
* Delete /SINSONTE/software/sdk/build/CMakeCache.txt file
* Delete /SINSONTE/software/sdk/build/elf2uf2/CMakeCache.txt file

Using the command line terminal go to the folder /SINSONTE/software/sdk/build
~~~
cd software/sdk/build
~~~
Generate makefiles
~~~
cmake ..
~~~
And finally compile:
~~~
make clean
make all
~~~
(.uf2) downloadable compiled file lies in /SINSONTE/software/sdk/build


## How to change sound files

The sample program shown here, plays 12 different sound files sequentially. If you want to change one or all of them, the following rules must be taken into account:

* Max sound storage capacity is 24 seconds total (~2 seconds per file * 12 files = ~24 seconds)
* Sound files have to be in .WAV mono 16 bit @ 44100 hz before being processed by the script which converts them into C array[]

Look for **wav2c.py** script in /SINSONTE/software/sdk/utils/ folder to convert your own sounds.

This script need two parameters: input sound file name (.wav) and output file name (.h). The files have to be named 1.h to 12.h. Here is an example:

~~~
python3 wav2c.py example.wav 5.h
~~~

The generated file (5.h) needs to be put in /SINSONTE/software/sdk folder and then recompile!

# CircuitPython
## How to use this repository
Clone project repository
~~~
git clone https://github.com/galopago/SINSONTE.git
~~~
* Put Rpi Pico in programming mode and then plug into a PC
* To start fresh, download to the Rpi Pico the file **flash_nuke.uf2** located in /SINSONTE/software/cp/utils
* Put Rpi Pico in programming mode again and then plug into a PC
* Install CircuitPython runtime downloading the file **adafruit-circuitpython-raspberry_pi_pico-en_US-6.3.0.uf2** located in /SINSONTE/software/cp/utils
* Once CircuitPython is installed, download to the Rpi Pico **code.py** and the sound files (1.mp3 to 12.mp3) located in /SINSONTE/software/cp/ folder

## How to change sound files
Download to the Rpi Pico your own .mp3 file, it needs to be named 1.mp3 to 12.mp3


## License
This is an Open Source project and is licensed under [MIT License](https://spdx.org/licenses/MIT.html)
