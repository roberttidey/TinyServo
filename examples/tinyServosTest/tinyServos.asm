
tinyServosTest.ino.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0e c0       	rjmp	.+28     	; 0x1e <__ctors_end>
   2:	1d c0       	rjmp	.+58     	; 0x3e <__bad_interrupt>
   4:	1c c0       	rjmp	.+56     	; 0x3e <__bad_interrupt>
   6:	1b c0       	rjmp	.+54     	; 0x3e <__bad_interrupt>
   8:	26 c1       	rjmp	.+588    	; 0x256 <__vector_4>
   a:	3f c0       	rjmp	.+126    	; 0x8a <__vector_5>
   c:	18 c0       	rjmp	.+48     	; 0x3e <__bad_interrupt>
   e:	17 c0       	rjmp	.+46     	; 0x3e <__bad_interrupt>
  10:	16 c0       	rjmp	.+44     	; 0x3e <__bad_interrupt>
  12:	15 c0       	rjmp	.+42     	; 0x3e <__bad_interrupt>
  14:	14 c0       	rjmp	.+40     	; 0x3e <__bad_interrupt>
  16:	13 c0       	rjmp	.+38     	; 0x3e <__bad_interrupt>
  18:	12 c0       	rjmp	.+36     	; 0x3e <__bad_interrupt>
  1a:	11 c0       	rjmp	.+34     	; 0x3e <__bad_interrupt>
  1c:	10 c0       	rjmp	.+32     	; 0x3e <__bad_interrupt>

0000001e <__ctors_end>:
  1e:	11 24       	eor	r1, r1
  20:	1f be       	out	0x3f, r1	; 63
  22:	cf e5       	ldi	r28, 0x5F	; 95
  24:	d2 e0       	ldi	r29, 0x02	; 2
  26:	de bf       	out	0x3e, r29	; 62
  28:	cd bf       	out	0x3d, r28	; 61

0000002a <__do_clear_bss>:
  2a:	20 e0       	ldi	r18, 0x00	; 0
  2c:	a0 e6       	ldi	r26, 0x60	; 96
  2e:	b0 e0       	ldi	r27, 0x00	; 0
  30:	01 c0       	rjmp	.+2      	; 0x34 <.do_clear_bss_start>

00000032 <.do_clear_bss_loop>:
  32:	1d 92       	st	X+, r1

00000034 <.do_clear_bss_start>:
  34:	a4 39       	cpi	r26, 0x94	; 148
  36:	b2 07       	cpc	r27, r18
  38:	e1 f7       	brne	.-8      	; 0x32 <.do_clear_bss_loop>
  3a:	b5 d1       	rcall	.+874    	; 0x3a6 <main>
  3c:	d2 c1       	rjmp	.+932    	; 0x3e2 <_exit>

0000003e <__bad_interrupt>:
  3e:	e0 cf       	rjmp	.-64     	; 0x0 <__vectors>

00000040 <setup>:
  40:	b6 c0       	rjmp	.+364    	; 0x1ae <_Z11tServosInitv>

00000042 <loop>:
  42:	60 91 60 00 	lds	r22, 0x0060
  46:	80 91 62 00 	lds	r24, 0x0062
  4a:	f4 d0       	rcall	.+488    	; 0x234 <_Z14tServoPositionhh>
  4c:	80 91 60 00 	lds	r24, 0x0060
  50:	90 91 61 00 	lds	r25, 0x0061
  54:	45 96       	adiw	r24, 0x15	; 21
  56:	90 93 61 00 	sts	0x0061, r25
  5a:	80 93 60 00 	sts	0x0060, r24
  5e:	8f 3f       	cpi	r24, 0xFF	; 255
  60:	91 05       	cpc	r25, r1
  62:	71 f0       	breq	.+28     	; 0x80 <loop+0x3e>
  64:	68 f0       	brcs	.+26     	; 0x80 <loop+0x3e>
  66:	10 92 61 00 	sts	0x0061, r1
  6a:	10 92 60 00 	sts	0x0060, r1
  6e:	80 91 62 00 	lds	r24, 0x0062
  72:	8f 5f       	subi	r24, 0xFF	; 255
  74:	80 93 62 00 	sts	0x0062, r24
  78:	86 30       	cpi	r24, 0x06	; 6
  7a:	10 f0       	brcs	.+4      	; 0x80 <loop+0x3e>
  7c:	10 92 62 00 	sts	0x0062, r1
  80:	68 eb       	ldi	r22, 0xB8	; 184
  82:	7b e0       	ldi	r23, 0x0B	; 11
  84:	80 e0       	ldi	r24, 0x00	; 0
  86:	90 e0       	ldi	r25, 0x00	; 0
  88:	51 c1       	rjmp	.+674    	; 0x32c <delay>

0000008a <__vector_5>:
  8a:	1f 92       	push	r1
  8c:	0f 92       	push	r0
  8e:	0f b6       	in	r0, 0x3f	; 63
  90:	0f 92       	push	r0
  92:	11 24       	eor	r1, r1
  94:	8f 93       	push	r24
  96:	9f 93       	push	r25
  98:	ef 93       	push	r30
  9a:	ff 93       	push	r31
  9c:	80 91 65 00 	lds	r24, 0x0065
  a0:	81 50       	subi	r24, 0x01	; 1
  a2:	80 93 65 00 	sts	0x0065, r24
  a6:	82 30       	cpi	r24, 0x02	; 2
  a8:	08 f0       	brcs	.+2      	; 0xac <__vector_5+0x22>
  aa:	3f c0       	rjmp	.+126    	; 0x12a <__vector_5+0xa0>
  ac:	88 23       	and	r24, r24
  ae:	21 f0       	breq	.+8      	; 0xb8 <__vector_5+0x2e>
  b0:	80 91 64 00 	lds	r24, 0x0064
  b4:	8f 3f       	cpi	r24, 0xFF	; 255
  b6:	c9 f5       	brne	.+114    	; 0x12a <__vector_5+0xa0>
  b8:	80 91 63 00 	lds	r24, 0x0063
  bc:	e0 91 66 00 	lds	r30, 0x0066
  c0:	82 30       	cpi	r24, 0x02	; 2
  c2:	b9 f4       	brne	.+46     	; 0xf2 <__vector_5+0x68>
  c4:	ea 5f       	subi	r30, 0xFA	; 250
  c6:	e4 32       	cpi	r30, 0x24	; 36
  c8:	18 f4       	brcc	.+6      	; 0xd0 <__vector_5+0x46>
  ca:	e0 93 66 00 	sts	0x0066, r30
  ce:	02 c0       	rjmp	.+4      	; 0xd4 <__vector_5+0x4a>
  d0:	10 92 66 00 	sts	0x0066, r1
  d4:	e0 91 66 00 	lds	r30, 0x0066
  d8:	f0 e0       	ldi	r31, 0x00	; 0
  da:	e9 59       	subi	r30, 0x99	; 153
  dc:	ff 4f       	sbci	r31, 0xFF	; 255
  de:	81 81       	ldd	r24, Z+1	; 0x01
  e0:	88 23       	and	r24, r24
  e2:	91 f0       	breq	.+36     	; 0x108 <__vector_5+0x7e>
  e4:	10 92 63 00 	sts	0x0063, r1
  e8:	86 b3       	in	r24, 0x16	; 22
  ea:	90 81       	ld	r25, Z
  ec:	89 2b       	or	r24, r25
  ee:	86 bb       	out	0x16, r24	; 22
  f0:	0b c0       	rjmp	.+22     	; 0x108 <__vector_5+0x7e>
  f2:	96 b3       	in	r25, 0x16	; 22
  f4:	f0 e0       	ldi	r31, 0x00	; 0
  f6:	e9 59       	subi	r30, 0x99	; 153
  f8:	ff 4f       	sbci	r31, 0xFF	; 255
  fa:	80 81       	ld	r24, Z
  fc:	80 95       	com	r24
  fe:	89 23       	and	r24, r25
 100:	86 bb       	out	0x16, r24	; 22
 102:	82 e0       	ldi	r24, 0x02	; 2
 104:	80 93 63 00 	sts	0x0063, r24
 108:	e0 91 66 00 	lds	r30, 0x0066
 10c:	f0 e0       	ldi	r31, 0x00	; 0
 10e:	80 91 63 00 	lds	r24, 0x0063
 112:	e9 59       	subi	r30, 0x99	; 153
 114:	ff 4f       	sbci	r31, 0xFF	; 255
 116:	e8 0f       	add	r30, r24
 118:	f1 1d       	adc	r31, r1
 11a:	83 81       	ldd	r24, Z+3	; 0x03
 11c:	8f 5f       	subi	r24, 0xFF	; 255
 11e:	80 93 65 00 	sts	0x0065, r24
 122:	82 81       	ldd	r24, Z+2	; 0x02
 124:	80 93 64 00 	sts	0x0064, r24
 128:	82 bf       	out	0x32, r24	; 50
 12a:	ff 91       	pop	r31
 12c:	ef 91       	pop	r30
 12e:	9f 91       	pop	r25
 130:	8f 91       	pop	r24
 132:	0f 90       	pop	r0
 134:	0f be       	out	0x3f, r0	; 63
 136:	0f 90       	pop	r0
 138:	1f 90       	pop	r1
 13a:	18 95       	reti

0000013c <_Z14tServoPositionhhh>:
 13c:	e8 2f       	mov	r30, r24
 13e:	86 30       	cpi	r24, 0x06	; 6
 140:	a8 f5       	brcc	.+106    	; 0x1ac <_Z14tServoPositionhhh+0x70>
 142:	44 23       	and	r20, r20
 144:	61 f0       	breq	.+24     	; 0x15e <_Z14tServoPositionhhh+0x22>
 146:	86 2f       	mov	r24, r22
 148:	90 e0       	ldi	r25, 0x00	; 0
 14a:	60 ed       	ldi	r22, 0xD0	; 208
 14c:	71 e0       	ldi	r23, 0x01	; 1
 14e:	38 d1       	rcall	.+624    	; 0x3c0 <__mulhi3>
 150:	29 2f       	mov	r18, r25
 152:	39 2f       	mov	r19, r25
 154:	33 0f       	add	r19, r19
 156:	33 0b       	sbc	r19, r19
 158:	28 57       	subi	r18, 0x78	; 120
 15a:	3f 4f       	sbci	r19, 0xFF	; 255
 15c:	02 c0       	rjmp	.+4      	; 0x162 <_Z14tServoPositionhhh+0x26>
 15e:	20 e0       	ldi	r18, 0x00	; 0
 160:	30 e0       	ldi	r19, 0x00	; 0
 162:	8e 2f       	mov	r24, r30
 164:	66 e0       	ldi	r22, 0x06	; 6
 166:	23 d1       	rcall	.+582    	; 0x3ae <__mulqi3>
 168:	a8 2f       	mov	r26, r24
 16a:	b0 e0       	ldi	r27, 0x00	; 0
 16c:	fd 01       	movw	r30, r26
 16e:	e9 59       	subi	r30, 0x99	; 153
 170:	ff 4f       	sbci	r31, 0xFF	; 255
 172:	82 2f       	mov	r24, r18
 174:	80 95       	com	r24
 176:	82 83       	std	Z+2, r24	; 0x02
 178:	33 83       	std	Z+3, r19	; 0x03
 17a:	81 e4       	ldi	r24, 0x41	; 65
 17c:	82 1b       	sub	r24, r18
 17e:	80 95       	com	r24
 180:	84 83       	std	Z+4, r24	; 0x04
 182:	61 e4       	ldi	r22, 0x41	; 65
 184:	73 e0       	ldi	r23, 0x03	; 3
 186:	62 1b       	sub	r22, r18
 188:	73 0b       	sbc	r23, r19
 18a:	75 83       	std	Z+5, r23	; 0x05
 18c:	a8 59       	subi	r26, 0x98	; 152
 18e:	bf 4f       	sbci	r27, 0xFF	; 255
 190:	8c 91       	ld	r24, X
 192:	84 17       	cp	r24, r20
 194:	59 f0       	breq	.+22     	; 0x1ac <_Z14tServoPositionhhh+0x70>
 196:	4c 93       	st	X, r20
 198:	80 81       	ld	r24, Z
 19a:	97 b3       	in	r25, 0x17	; 23
 19c:	44 23       	and	r20, r20
 19e:	19 f0       	breq	.+6      	; 0x1a6 <_Z14tServoPositionhhh+0x6a>
 1a0:	98 2b       	or	r25, r24
 1a2:	97 bb       	out	0x17, r25	; 23
 1a4:	08 95       	ret
 1a6:	80 95       	com	r24
 1a8:	89 23       	and	r24, r25
 1aa:	87 bb       	out	0x17, r24	; 23
 1ac:	08 95       	ret

000001ae <_Z11tServosInitv>:
 1ae:	df 92       	push	r13
 1b0:	ef 92       	push	r14
 1b2:	ff 92       	push	r15
 1b4:	0f 93       	push	r16
 1b6:	1f 93       	push	r17
 1b8:	cf 93       	push	r28
 1ba:	df 93       	push	r29
 1bc:	88 e6       	ldi	r24, 0x68	; 104
 1be:	e8 2e       	mov	r14, r24
 1c0:	80 e0       	ldi	r24, 0x00	; 0
 1c2:	f8 2e       	mov	r15, r24
 1c4:	e7 01       	movw	r28, r14
 1c6:	00 e0       	ldi	r16, 0x00	; 0
 1c8:	10 e0       	ldi	r17, 0x00	; 0
 1ca:	dd 24       	eor	r13, r13
 1cc:	d3 94       	inc	r13
 1ce:	fe 01       	movw	r30, r28
 1d0:	31 97       	sbiw	r30, 0x01	; 1
 1d2:	8d 2d       	mov	r24, r13
 1d4:	00 2e       	mov	r0, r16
 1d6:	01 c0       	rjmp	.+2      	; 0x1da <_Z11tServosInitv+0x2c>
 1d8:	88 0f       	add	r24, r24
 1da:	0a 94       	dec	r0
 1dc:	ea f7       	brpl	.-6      	; 0x1d8 <_Z11tServosInitv+0x2a>
 1de:	80 83       	st	Z, r24
 1e0:	18 82       	st	Y, r1
 1e2:	40 e0       	ldi	r20, 0x00	; 0
 1e4:	67 e7       	ldi	r22, 0x77	; 119
 1e6:	8c 2f       	mov	r24, r28
 1e8:	8e 19       	sub	r24, r14
 1ea:	a8 df       	rcall	.-176    	; 0x13c <_Z14tServoPositionhhh>
 1ec:	0f 5f       	subi	r16, 0xFF	; 255
 1ee:	1f 4f       	sbci	r17, 0xFF	; 255
 1f0:	26 96       	adiw	r28, 0x06	; 6
 1f2:	06 30       	cpi	r16, 0x06	; 6
 1f4:	11 05       	cpc	r17, r1
 1f6:	59 f7       	brne	.-42     	; 0x1ce <_Z11tServosInitv+0x20>
 1f8:	1a bc       	out	0x2a, r1	; 42
 1fa:	19 bc       	out	0x29, r1	; 41
 1fc:	18 bc       	out	0x28, r1	; 40
 1fe:	12 be       	out	0x32, r1	; 50
 200:	10 92 66 00 	sts	0x0066, r1
 204:	82 e0       	ldi	r24, 0x02	; 2
 206:	80 93 63 00 	sts	0x0063, r24
 20a:	80 91 6c 00 	lds	r24, 0x006C
 20e:	80 93 65 00 	sts	0x0065, r24
 212:	80 91 6b 00 	lds	r24, 0x006B
 216:	80 93 64 00 	sts	0x0064, r24
 21a:	89 b7       	in	r24, 0x39	; 57
 21c:	82 60       	ori	r24, 0x02	; 2
 21e:	89 bf       	out	0x39, r24	; 57
 220:	83 e0       	ldi	r24, 0x03	; 3
 222:	83 bf       	out	0x33, r24	; 51
 224:	df 91       	pop	r29
 226:	cf 91       	pop	r28
 228:	1f 91       	pop	r17
 22a:	0f 91       	pop	r16
 22c:	ff 90       	pop	r15
 22e:	ef 90       	pop	r14
 230:	df 90       	pop	r13
 232:	08 95       	ret

00000234 <_Z14tServoPositionhh>:
 234:	41 e0       	ldi	r20, 0x01	; 1
 236:	82 cf       	rjmp	.-252    	; 0x13c <_Z14tServoPositionhhh>

00000238 <initToneTimerInternal>:
 238:	83 b7       	in	r24, 0x33	; 51
 23a:	88 7f       	andi	r24, 0xF8	; 248
 23c:	83 bf       	out	0x33, r24	; 51
 23e:	8a b5       	in	r24, 0x2a	; 42
 240:	8c 7f       	andi	r24, 0xFC	; 252
 242:	81 60       	ori	r24, 0x01	; 1
 244:	8a bd       	out	0x2a, r24	; 42
 246:	83 b7       	in	r24, 0x33	; 51
 248:	87 7f       	andi	r24, 0xF7	; 247
 24a:	83 bf       	out	0x33, r24	; 51
 24c:	83 b7       	in	r24, 0x33	; 51
 24e:	88 7f       	andi	r24, 0xF8	; 248
 250:	83 60       	ori	r24, 0x03	; 3
 252:	83 bf       	out	0x33, r24	; 51
 254:	08 95       	ret

00000256 <__vector_4>:
 256:	78 94       	sei
 258:	1f 92       	push	r1
 25a:	0f 92       	push	r0
 25c:	0f b6       	in	r0, 0x3f	; 63
 25e:	0f 92       	push	r0
 260:	11 24       	eor	r1, r1
 262:	2f 93       	push	r18
 264:	3f 93       	push	r19
 266:	8f 93       	push	r24
 268:	9f 93       	push	r25
 26a:	af 93       	push	r26
 26c:	bf 93       	push	r27
 26e:	80 91 8c 00 	lds	r24, 0x008C
 272:	90 91 8d 00 	lds	r25, 0x008D
 276:	a0 91 8e 00 	lds	r26, 0x008E
 27a:	b0 91 8f 00 	lds	r27, 0x008F
 27e:	30 91 8b 00 	lds	r19, 0x008B
 282:	2c e7       	ldi	r18, 0x7C	; 124
 284:	23 0f       	add	r18, r19
 286:	2d 37       	cpi	r18, 0x7D	; 125
 288:	28 f0       	brcs	.+10     	; 0x294 <__stack+0x35>
 28a:	2f ef       	ldi	r18, 0xFF	; 255
 28c:	23 0f       	add	r18, r19
 28e:	01 96       	adiw	r24, 0x01	; 1
 290:	a1 1d       	adc	r26, r1
 292:	b1 1d       	adc	r27, r1
 294:	20 93 8b 00 	sts	0x008B, r18
 298:	80 93 8c 00 	sts	0x008C, r24
 29c:	90 93 8d 00 	sts	0x008D, r25
 2a0:	a0 93 8e 00 	sts	0x008E, r26
 2a4:	b0 93 8f 00 	sts	0x008F, r27
 2a8:	80 91 90 00 	lds	r24, 0x0090
 2ac:	90 91 91 00 	lds	r25, 0x0091
 2b0:	a0 91 92 00 	lds	r26, 0x0092
 2b4:	b0 91 93 00 	lds	r27, 0x0093
 2b8:	01 96       	adiw	r24, 0x01	; 1
 2ba:	a1 1d       	adc	r26, r1
 2bc:	b1 1d       	adc	r27, r1
 2be:	80 93 90 00 	sts	0x0090, r24
 2c2:	90 93 91 00 	sts	0x0091, r25
 2c6:	a0 93 92 00 	sts	0x0092, r26
 2ca:	b0 93 93 00 	sts	0x0093, r27
 2ce:	bf 91       	pop	r27
 2d0:	af 91       	pop	r26
 2d2:	9f 91       	pop	r25
 2d4:	8f 91       	pop	r24
 2d6:	3f 91       	pop	r19
 2d8:	2f 91       	pop	r18
 2da:	0f 90       	pop	r0
 2dc:	0f be       	out	0x3f, r0	; 63
 2de:	0f 90       	pop	r0
 2e0:	1f 90       	pop	r1
 2e2:	18 95       	reti

000002e4 <micros>:
 2e4:	3f b7       	in	r19, 0x3f	; 63
 2e6:	f8 94       	cli
 2e8:	80 91 90 00 	lds	r24, 0x0090
 2ec:	90 91 91 00 	lds	r25, 0x0091
 2f0:	a0 91 92 00 	lds	r26, 0x0092
 2f4:	b0 91 93 00 	lds	r27, 0x0093
 2f8:	2f b5       	in	r18, 0x2f	; 47
 2fa:	08 b6       	in	r0, 0x38	; 56
 2fc:	02 fe       	sbrs	r0, 2
 2fe:	05 c0       	rjmp	.+10     	; 0x30a <micros+0x26>
 300:	2f 3f       	cpi	r18, 0xFF	; 255
 302:	19 f0       	breq	.+6      	; 0x30a <micros+0x26>
 304:	01 96       	adiw	r24, 0x01	; 1
 306:	a1 1d       	adc	r26, r1
 308:	b1 1d       	adc	r27, r1
 30a:	3f bf       	out	0x3f, r19	; 63
 30c:	66 27       	eor	r22, r22
 30e:	78 2f       	mov	r23, r24
 310:	89 2f       	mov	r24, r25
 312:	9a 2f       	mov	r25, r26
 314:	62 0f       	add	r22, r18
 316:	71 1d       	adc	r23, r1
 318:	81 1d       	adc	r24, r1
 31a:	91 1d       	adc	r25, r1
 31c:	42 e0       	ldi	r20, 0x02	; 2
 31e:	66 0f       	add	r22, r22
 320:	77 1f       	adc	r23, r23
 322:	88 1f       	adc	r24, r24
 324:	99 1f       	adc	r25, r25
 326:	4a 95       	dec	r20
 328:	d1 f7       	brne	.-12     	; 0x31e <micros+0x3a>
 32a:	08 95       	ret

0000032c <delay>:
 32c:	cf 92       	push	r12
 32e:	df 92       	push	r13
 330:	ef 92       	push	r14
 332:	ff 92       	push	r15
 334:	cf 93       	push	r28
 336:	df 93       	push	r29
 338:	6b 01       	movw	r12, r22
 33a:	7c 01       	movw	r14, r24
 33c:	d3 df       	rcall	.-90     	; 0x2e4 <micros>
 33e:	eb 01       	movw	r28, r22
 340:	c1 14       	cp	r12, r1
 342:	d1 04       	cpc	r13, r1
 344:	e1 04       	cpc	r14, r1
 346:	f1 04       	cpc	r15, r1
 348:	71 f0       	breq	.+28     	; 0x366 <delay+0x3a>
 34a:	cc df       	rcall	.-104    	; 0x2e4 <micros>
 34c:	6c 1b       	sub	r22, r28
 34e:	7d 0b       	sbc	r23, r29
 350:	68 3e       	cpi	r22, 0xE8	; 232
 352:	73 40       	sbci	r23, 0x03	; 3
 354:	a8 f3       	brcs	.-22     	; 0x340 <delay+0x14>
 356:	81 e0       	ldi	r24, 0x01	; 1
 358:	c8 1a       	sub	r12, r24
 35a:	d1 08       	sbc	r13, r1
 35c:	e1 08       	sbc	r14, r1
 35e:	f1 08       	sbc	r15, r1
 360:	c8 51       	subi	r28, 0x18	; 24
 362:	dc 4f       	sbci	r29, 0xFC	; 252
 364:	ed cf       	rjmp	.-38     	; 0x340 <delay+0x14>
 366:	df 91       	pop	r29
 368:	cf 91       	pop	r28
 36a:	ff 90       	pop	r15
 36c:	ef 90       	pop	r14
 36e:	df 90       	pop	r13
 370:	cf 90       	pop	r12
 372:	08 95       	ret

00000374 <init>:
 374:	78 94       	sei
 376:	80 b7       	in	r24, 0x30	; 48
 378:	80 68       	ori	r24, 0x80	; 128
 37a:	80 bf       	out	0x30, r24	; 48
 37c:	80 b7       	in	r24, 0x30	; 48
 37e:	80 64       	ori	r24, 0x40	; 64
 380:	80 bf       	out	0x30, r24	; 48
 382:	8c b5       	in	r24, 0x2c	; 44
 384:	80 64       	ori	r24, 0x40	; 64
 386:	8c bd       	out	0x2c, r24	; 44
 388:	8f ef       	ldi	r24, 0xFF	; 255
 38a:	8d bd       	out	0x2d, r24	; 45
 38c:	80 b7       	in	r24, 0x30	; 48
 38e:	80 7f       	andi	r24, 0xF0	; 240
 390:	87 60       	ori	r24, 0x07	; 7
 392:	80 bf       	out	0x30, r24	; 48
 394:	89 b7       	in	r24, 0x39	; 57
 396:	84 60       	ori	r24, 0x04	; 4
 398:	89 bf       	out	0x39, r24	; 57
 39a:	4e df       	rcall	.-356    	; 0x238 <initToneTimerInternal>
 39c:	86 b1       	in	r24, 0x06	; 6
 39e:	87 60       	ori	r24, 0x07	; 7
 3a0:	86 b9       	out	0x06, r24	; 6
 3a2:	37 9a       	sbi	0x06, 7	; 6
 3a4:	08 95       	ret

000003a6 <main>:
 3a6:	e6 df       	rcall	.-52     	; 0x374 <init>
 3a8:	4b de       	rcall	.-874    	; 0x40 <setup>
 3aa:	4b de       	rcall	.-874    	; 0x42 <loop>
 3ac:	fe cf       	rjmp	.-4      	; 0x3aa <main+0x4>

000003ae <__mulqi3>:
 3ae:	00 24       	eor	r0, r0

000003b0 <__mulqi3_loop>:
 3b0:	80 fd       	sbrc	r24, 0
 3b2:	06 0e       	add	r0, r22
 3b4:	66 0f       	add	r22, r22
 3b6:	11 f0       	breq	.+4      	; 0x3bc <__mulqi3_exit>
 3b8:	86 95       	lsr	r24
 3ba:	d1 f7       	brne	.-12     	; 0x3b0 <__mulqi3_loop>

000003bc <__mulqi3_exit>:
 3bc:	80 2d       	mov	r24, r0
 3be:	08 95       	ret

000003c0 <__mulhi3>:
 3c0:	00 24       	eor	r0, r0
 3c2:	55 27       	eor	r21, r21
 3c4:	04 c0       	rjmp	.+8      	; 0x3ce <__mulhi3+0xe>
 3c6:	08 0e       	add	r0, r24
 3c8:	59 1f       	adc	r21, r25
 3ca:	88 0f       	add	r24, r24
 3cc:	99 1f       	adc	r25, r25
 3ce:	00 97       	sbiw	r24, 0x00	; 0
 3d0:	29 f0       	breq	.+10     	; 0x3dc <__mulhi3+0x1c>
 3d2:	76 95       	lsr	r23
 3d4:	67 95       	ror	r22
 3d6:	b8 f3       	brcs	.-18     	; 0x3c6 <__mulhi3+0x6>
 3d8:	71 05       	cpc	r23, r1
 3da:	b9 f7       	brne	.-18     	; 0x3ca <__mulhi3+0xa>
 3dc:	80 2d       	mov	r24, r0
 3de:	95 2f       	mov	r25, r21
 3e0:	08 95       	ret

000003e2 <_exit>:
 3e2:	f8 94       	cli

000003e4 <__stop_program>:
 3e4:	ff cf       	rjmp	.-2      	; 0x3e4 <__stop_program>
