# SOUND PLAYER BASED ON RPI PICO

Sound player based on Raspberry Rpi Pico. Sound data is stored in internal memory. Very few external (easy to find & solder) components required. The project was designed to be in sleep mode for very long time powered by batteries. Can be used for musical wall clocks, talking dolls, toys, etc.

![BOARD](/docs/sinsonte.jpg)

Printed circuit board with all components soldered.

Also read this in other languages: [Espanol](/docs/README.es.md)

## Working principle

The circuit ([see schematic](/docs/schematic.pdf)) has been designed to stay most of the time in silence powered by 2 AA bateries, like musical wall clocks or talking toys. In the best scenario, Rpi Pico in in deep sleep mode, will drain aprox 1.3 mAh from the batteries. A pair of AA batteries in series have around 2000 mAh of juice, just in standby they will last only for two months. Unnaceptable!.

An external circuit was added to totally power off Rpi Pico via 3V3_EN pin. Drainin just only 70 uA, wich translates to 3 years of standby. Much better!

The circuit work in the following manner: In standby mode, a capacitor with a large resistor holds the conduction voltage of a mosfet wich is in charge for tying 3V3_EN to ground, powering off the board completly. To play a sound, click friefly on the push button which discharges the capacitor and stops conduction of the mosfet. Now 3V3_EN pin is tied to V+ via its internall pull up, powering on the Rpi Pico Board. Once powered on and program booted, it keeps the capacitor discharged via a GPIO while sound is played. When the sound ends, the RPI Pico puts the GPIO in high input state, so the capacitor charges again and Rpi Powers off until next button click!

There are many stored sounds in the Rpi Pico, and they are played in sequence. To know wich sound needs to be played in the next click, some data needs to be preserved between power offs, that data is stored in the internal flash memory. Be carefull modyifing the program to keep flash writes to a minium



## Directory structure

Hardware folder contains schematic and printed circuit board.
* /hardware/ folder contains KiCad V5.1 project
* /hardware/gerber folder contains ready to manufacture files.
* /hardware/modules folder contains additional footprints needed to edit printed circuit board.
* /hardware/library folder contains additional symbols needed to edit schematic.

Software folder contains program source code.
* /software/ folder contains C source code develped in the Raspberry Pi Pico SDK.
* /software/utils folder contain additional python scripts.
* /software/uf2_binaries folder contains compiled programs ready for download to the Rpi Pico.
* /software/sounds folder contains sound files source in form of C arrays[].
* /software/build folder will contain downloadable binaries once compiled.

Docs folder conains additional info files

## How to use this repository

This is a very brief guide how to install Rpi Pico SDK in Linux (Ubuntu!). For more info please visit [oficial repo](https://github.com/raspberrypi/pico-sdk)
~~~
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
git clone -b master https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git submodule update --init
~~~
Add the line below to .bashrc file, and then restart session to allow changes to take effect.
~~~
export PICO_SDK_PATH={ruta sdk}/pico-sdk
~~~
Clone project repository
~~~
git clone https://github.com/galopago/SINSONTE.git
~~~
* Modify /SINSONTE/software/CMakeLists.txt file change Rpi Pico SDK paths with your own installation paths.
* Delete /SINSONTE/software/build/CMakeCache.txt file
* Delete /SINSONTE/software/build/elf2uf2/CMakeCache.txt file

Using the command line terminall go to the folder /SINSONTE/software/build
~~~
cd software/build
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
(.uf2) downloadable compiled file lies in /SINSONTE/software/build


## How to change sound files

El programa presentado aqui reproduce 12 diferentes archivos de sonido de forma secuencial. Si se quiere cambiar uno o todos los archivos se debera tener en cuenta lo siguiente:

* La duracion maxima de almacenamiento de la memoria es de 24 segundos (2 segundos por sonido * 12 = 24 segundos)
* Los archivos deberan convertirse a formato .WAV monofonico de 16 bits y a 44100 hz antes de ser procesados por la aplicacion que los convertira en array[] de C.


Una vez se tienen los archivos con las caracteristicas anteriormente mencionadas, se usara la aplicacion **wav2c.py** que se encuentra en la ruta /SINSONTE/software/utils/

Esta aplicacion recibe dos parameteros: el nombre de arhcivo de entrada (.wav) y nombre de archivo de salida (.h). Los nombres de los archivos convertidos deberan llamarse 1.h a 12.h. Un ejemplo seria el siguiente:

~~~
python3 wav2c.py ejemplo.wav 5.h
~~~

El archivo generado (5.h) debera ponerse en la carpeta /SINSONTE/software/ y recompilar el codigo


## Licencia
Este es un proyecto de Software Libre y esta licenciado bajo una licencia [MIT License](https://spdx.org/licenses/MIT.html)
