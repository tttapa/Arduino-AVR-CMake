# Enter CMake cross-compilation mode
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)

# User settings with sensible defaults
if(CMAKE_HOST_WIN32)
    set(ARDUINO_PATH_DEFAULT "$ENV{LOCALAPPDATA}/Arduino15/packages/arduino")
else()
    set(ARDUINO_PATH_DEFAULT "$ENV{HOME}/.arduino15/packages/arduino")
endif()
set(ARDUINO_PATH "${ARDUINO_PATH_DEFAULT}" CACHE PATH
    "Path of the Arduino packages folder, e.g. ~/.arduino15/packages/arduino.")

set(ARDUINO_CORE_VERSION "1.8.6" CACHE STRING
    "Version of arduino/ArduinoCore-AVR")
set(AVR_GCC_VERSION "7.3.0-atmel3.6.1-arduino7" CACHE STRING
    "Full version string of the GCC release shipped with the Arduino core.")
set(AVRDUDE_VERSION "6.3.0-arduino17" CACHE STRING
    "Full version string of the avrdude release shipped with the Arduino core.")
set(ARDUINO_VERSION "10815" CACHE STRING
    "Arduino IDE version (used for the macro with the same name)")

# Derived paths
set(ARDUINO_AVR_PATH ${ARDUINO_PATH}/hardware/avr/${ARDUINO_CORE_VERSION})
set(ARDUINO_CORE_PATH ${ARDUINO_AVR_PATH}/cores/arduino)
set(ARDUINO_TOOLS_PATH ${ARDUINO_PATH}/tools/avr-gcc/${AVR_GCC_VERSION}/bin)
set(ARDUINO_AVRDUDE_PATH ${ARDUINO_PATH}/tools/avrdude/${AVRDUDE_VERSION})
set(ARDUINO_AVRDUDE_CONF ${ARDUINO_AVRDUDE_PATH}/etc/avrdude.conf)

# Toolchain paths
find_program(CMAKE_C_COMPILER avr-gcc PATHS "${ARDUINO_TOOLS_PATH}" NO_DEFAULT_PATH
    DOC "Path to avr-gcc")
find_program(CMAKE_CXX_COMPILER avr-g++ PATHS "${ARDUINO_TOOLS_PATH}" NO_DEFAULT_PATH
    DOC "Path to avr-g++")
find_program(CMAKE_OBJCOPY avr-objcopy PATHS "${ARDUINO_TOOLS_PATH}" NO_DEFAULT_PATH
    DOC "Path to avr-objcopy")
find_program(CMAKE_SIZE avr-size PATHS "${ARDUINO_TOOLS_PATH}" NO_DEFAULT_PATH
    DOC "Path to avr-size")
find_program(ARDUINO_AVRDUDE avrdude PATHS "${ARDUINO_AVRDUDE_PATH}/bin" NO_DEFAULT_PATH
    DOC "Path to avrdude")

# Only look libraries etc. in the sysroot, but never look there for programs
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
