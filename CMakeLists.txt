cmake_minimum_required(VERSION 3.19)
project(Blink LANGUAGES C CXX ASM)

include(cmake/lto.cmake)
include(cmake/arduino_core.cmake)
include(cmake/arduino_hex.cmake)
include(cmake/arduino_upload.cmake)
include(cmake/arduino_libs.cmake)

add_executable(blink blink.cpp)

# Remove comments from libraries you wish to use
target_link_libraries(blink PUBLIC 
    ArduinoCore
    #ArduinoEEPROM
    #ArduinoHID
    #ArduinoSPI
    #ArduinoSoftSerial
    #ArduinoWire
)
target_compile_options(blink PRIVATE
    "-Wall"
    "-Wextra"
    "-pedantic"
)
arduino_avr_hex(blink)

set(ARDUINO_PORT "/dev/ttyACM0"
    CACHE STRING "The serial port for uploading using avrdude")
arduino_avr_upload(blink ${ARDUINO_PORT})
