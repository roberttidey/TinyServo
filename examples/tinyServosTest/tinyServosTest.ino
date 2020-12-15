//Test for tinyServos library
//R.J.Tidey 4 Dec 2020

#include <Arduino.h>
#include <TinyServos.h>
// non zero values will update OSCVAL to get better clock accuracy
#define OSCCAL_VAL 0

void setup() {
	if(OSCCAL_VAL > 0) OSCCAL = OSCCAL_VAL;
	tServosInit();
}

uint8_t pin = 0;
uint8_t position = 10;
uint8_t direction = 0;

void loop() {
	for(pin = 0; pin < MAX_SERVOPINS; pin++) {
		tServoPosition(pin, position);
	}
	if(direction)
		position += 5;
	else
		position -= 5;
	if(position > 240 || position < 10) {
		direction ^= 1;
	}
	delay(500);
}
