# TinyServo

- This library is multi servo driver for ATTiny use
- It is targetted for PortB pins and allows any combination of the 6 pins to be used for servos.
- Uses one timer to operate all servos independently and in the background

### Functions
- void tServosInit(); // Init servos operation
- void tServoPosition(uint8_t pin, uint8_t position, uint8_t en); // set servo position + enable
- void tServoPosition(uint8_t pin, uint8_t position); // set servo position
- void tServoDisable(uint8_t pin); // disable servo

### Configuration
- defaults to 16MHz clock and servo pulse from 0.5mS to 2.4mS
- clocking may be adjusted by setting different divider and period definitions in .cpp
- servo pulse minimum to maximum range may be adjusted in .cpp 


