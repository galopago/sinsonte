# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# initalize pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH "/home/oportunidad/Desktop/repos/pico-sdk")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(sinsonte C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1

add_executable(sinsonte sinsonte.c )

pico_set_program_name(sinsonte "sinsonte")
pico_set_program_version(sinsonte "0.1")

pico_enable_stdio_uart(sinsonte 1)
pico_enable_stdio_usb(sinsonte 0)

# Add the standard library to the build
target_link_libraries(sinsonte 
		pico_stdlib
		hardware_pwm
		hardware_flash
		hardware_adc
		)

pico_add_extra_outputs(sinsonte)

