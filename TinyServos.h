/*
* TinyServosLibrary for ATTiny25,45,85 family
*/

#ifndef TINYSERVOS
#define TINYSERVOS

#define MAX_SERVOPINS		6

// Init servos operation
void tServosInit();

// set 1 servo position and  enable
void tServoPosition(uint8_t pin, uint8_t position, uint8_t en);

// set 1 servo position
void tServoPosition(uint8_t pin, uint8_t position);

// disable servo
void tServoDisable(uint8_t pin);

#endif
