/*
* TinyServosLibrary for ATTiny25,45,85 family
*/

//define to use asm interrupt routine 
#define USE_ASM

#include <Arduino.h>
#include <TinyServos.h>
#include <avr/io.h>

//fields in TSERVO DATA
#define TSERVO_PINMASK		0
#define TSERVO_ENABLE		1
#define TSERVO_TARGETLSB1	2
#define TSERVO_TARGETMSB1	3
#define TSERVO_TARGETLSB2	4
#define TSERVO_TARGETMSB2	5
#define TSERVO_FIELDS		6

#define TSERVO_MAXINDEX		MAX_SERVOPINS  * TSERVO_FIELDS

// in microseconds
//timer period
#define TIM0_DIVIDER			3 // 64
#define TIM0_PERIOD				4 //16MHz/64
#define TSERVO_MIN_PULSE		544 / TIM0_PERIOD
#define TSERVO_MAX_PULSE		2400/ TIM0_PERIOD
#define TSERVO_DEFAULT_PULSE	1500/ TIM0_PERIOD
#define TSERVO_INTERVAL			20000 / MAX_SERVOPINS / TIM0_PERIOD

// Servo data array of fields
static volatile uint8_t tServoData[TSERVO_MAXINDEX];

static volatile uint8_t tdIndex;
static volatile uint8_t overflowMSB;
static volatile uint8_t pulseState;

ISR(TIM0_OVF_vect) {
	overflowMSB--;
	if(overflowMSB < 2) {
		if(overflowMSB == 0) {
			PINB ^= 8; //test
			if(pulseState == 0) {
				if(tServoData[tdIndex + TSERVO_ENABLE]) {
					PINB &= ~tServoData[tdIndex + TSERVO_PINMASK];
				}
				pulseState = 2;
			} else {
				tdIndex += TSERVO_FIELDS;
				if(tdIndex >= TSERVO_MAXINDEX) tdIndex = 0;
				if(tServoData[tdIndex + TSERVO_ENABLE]) {
					PINB |= tServoData[tdIndex + TSERVO_PINMASK];
				}
				pulseState = 0;
			}
			overflowMSB = tServoData[tdIndex + pulseState + TSERVO_TARGETMSB1];
			if(overflowMSB == 1) TCNT0 = tServoData[tdIndex + pulseState + TSERVO_TARGETLSB1];
		} else {
			TCNT0 = tServoData[tdIndex + pulseState + TSERVO_TARGETLSB1];
		}
	}
}

void tServosInit() {
	uint8_t ix;
	uint8_t pin = 0;
	uint16_t target1 = 600;
	uint16_t target2 = 200;
	for(pin = 0; pin < MAX_SERVOPINS * TSERVO_FIELDS; pin++) {
		ix = pin * TSERVO_FIELDS;
		tServoData[ix + TSERVO_PINMASK] = 1 << pin;
		tServoPosition(pin, 128, 0);
		//tServoData[ix + TSERVO_ENABLE] = 0;
	}
	TCCR0A = 0; //Timer0_SetDefaults
	OCR0A = 0;
	OCR0B = 0;
	TCNT0 = 0;
	tdIndex = 0;
	pulseState = 0;
	overflowMSB = tServoData[TSERVO_TARGETMSB1];
	if(overflowMSB == 1) TCNT0 = tServoData[TSERVO_TARGETLSB1];
	TIMSK |= (1<<TOIE0); //Timer0_EnableOverflowInterrupt
	TCCR0B = TIM0_DIVIDER; //clk/64
	pinMode(3,OUTPUT); //test
}

// Set servo position and enable flag
void tServoPosition(uint8_t pin, uint8_t position, uint8_t en) {
	uint16_t target;
	uint8_t ix = pin * TSERVO_FIELDS;
	if(pin < MAX_SERVOPINS) {
		if (en) DDRB |= tServoData[ix + TSERVO_PINMASK];
		target = TSERVO_MIN_PULSE + (uint32_t)position * (TSERVO_MAX_PULSE - TSERVO_MIN_PULSE) / 256;
		tServoData[ix + TSERVO_ENABLE] = en;
		tServoData[ix + TSERVO_TARGETLSB1] = ~(target & 0xFF);
		tServoData[ix + TSERVO_TARGETMSB1] = (target >> 8) + 1;
		tServoData[ix + TSERVO_TARGETLSB2] = ~((TSERVO_INTERVAL - target) & 0xFF);
		tServoData[ix + TSERVO_TARGETMSB2] = ((TSERVO_INTERVAL - target) >> 8) + 1;
	}
}

// Set servo position
void tServoPosition(uint8_t pin, uint8_t position) {
	tServoPosition(pin, position, 1);
}

// Set servo disable
void tServoDisable(uint8_t pin) {
	uint8_t ix = pin * TSERVO_FIELDS;
	tServoData[ix + TSERVO_ENABLE] = 0;
	DDRB &= ~tServoData[ix + TSERVO_PINMASK];
}
