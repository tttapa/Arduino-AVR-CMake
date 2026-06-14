# Adds libraries included by default in arduino installs

set(ARDUINO_LIB_PATH ${ARDUINO_AVR_PATH}/libraries)

# EEPROM
add_library(ArduinoEEPROM INTERFACE)
target_include_directories(ArduinoEEPROM INTERFACE
    ${ARDUINO_LIB_PATH}/EEPROM/src
)
target_link_libraries(ArduinoEEPROM INTERFACE ArduinoCore)

# HID
add_library(ArduinoHID STATIC
    ${ARDUINO_LIB_PATH}/HID/src/HID.cpp
)
target_include_directories(ArduinoHID PUBLIC
    ${ARDUINO_LIB_PATH}/HID/src
)
target_link_libraries(ArduinoHID PUBLIC ArduinoCore)

# SPI
add_library(ArduinoSPI STATIC
    ${ARDUINO_LIB_PATH}/SPI/src/SPI.cpp
)
target_include_directories(ArduinoSPI PUBLIC
    ${ARDUINO_LIB_PATH}/SPI/src
)
target_link_libraries(ArduinoSPI PUBLIC ArduinoCore)

# SoftwareSerial
add_library(ArduinoSoftSerial STATIC
    ${ARDUINO_LIB_PATH}/SoftwareSerial/src/SoftwareSerial.cpp
)
target_include_directories(ArduinoSoftSerial PUBLIC
    ${ARDUINO_LIB_PATH}/SoftwareSerial/src
)
target_link_libraries(ArduinoSoftSerial PUBLIC ArduinoCore)

# Wire
add_library(ArduinoWire STATIC
    ${ARDUINO_LIB_PATH}/Wire/src/Wire.cpp
    ${ARDUINO_LIB_PATH}/Wire/src/utility/twi.c
)
target_include_directories(ArduinoWire PUBLIC
    ${ARDUINO_LIB_PATH}/Wire/src
)
target_link_libraries(ArduinoWire PUBLIC ArduinoCore)