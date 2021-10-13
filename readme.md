# SINSONTE
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
git clone -b master https://github.com/raspberrypi/pico-sdk.git
cd pico-sdk
git submodule update --init
Se añade la siguiente linea al archivo .bashrc
export PICO_SDK_PATH={ruta sdk}/pico-sdk

https://github.com/galopago/SINSONTE.git

/SINSONTE/software/CMakeLists.txt change pico sdk paths paths 
/SINSONTE/software/build delete CMakeCache.txt
/SINSONTE/software/build/elf2uf2 delete CMakeCache.txt

cmake ..

cd software/build/
make all
