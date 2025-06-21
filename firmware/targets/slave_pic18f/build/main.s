subtitle "Microchip MPLAB XC8 C Compiler v3.00 (Free license) build 20241204225717 Og1 "

pagewidth 120

	opt flic

	processor	18F1320
include "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc\18f1320.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
skiprom24 macro arg1
	btfsc arg1,7
endm
	global	__ramtop
	global	__accesstop
# 52 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PORTA equ 0F80h ;# 
# 244 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PORTB equ 0F81h ;# 
# 492 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
LATA equ 0F89h ;# 
# 594 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
LATB equ 0F8Ah ;# 
# 706 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TRISA equ 0F92h ;# 
# 711 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
DDRA equ 0F92h ;# 
# 908 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TRISB equ 0F93h ;# 
# 913 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
DDRB equ 0F93h ;# 
# 1130 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
OSCTUNE equ 0F9Bh ;# 
# 1188 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PIE1 equ 0F9Dh ;# 
# 1254 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PIR1 equ 0F9Eh ;# 
# 1320 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
IPR1 equ 0F9Fh ;# 
# 1386 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PIE2 equ 0FA0h ;# 
# 1427 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PIR2 equ 0FA1h ;# 
# 1468 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
IPR2 equ 0FA2h ;# 
# 1509 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
EECON1 equ 0FA6h ;# 
# 1575 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
EECON2 equ 0FA7h ;# 
# 1582 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
EEDATA equ 0FA8h ;# 
# 1589 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
EEADR equ 0FA9h ;# 
# 1596 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
BAUDCTL equ 0FAAh ;# 
# 1660 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCSTA equ 0FABh ;# 
# 1665 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCSTA1 equ 0FABh ;# 
# 1870 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TXSTA equ 0FACh ;# 
# 1875 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TXSTA1 equ 0FACh ;# 
# 2126 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TXREG equ 0FADh ;# 
# 2131 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TXREG1 equ 0FADh ;# 
# 2138 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCREG equ 0FAEh ;# 
# 2143 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCREG1 equ 0FAEh ;# 
# 2150 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
SPBRG equ 0FAFh ;# 
# 2155 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
SPBRG1 equ 0FAFh ;# 
# 2162 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
SPBRGH equ 0FB0h ;# 
# 2169 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
T3CON equ 0FB1h ;# 
# 2281 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR3 equ 0FB2h ;# 
# 2288 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR3L equ 0FB2h ;# 
# 2295 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR3H equ 0FB3h ;# 
# 2302 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ECCPAS equ 0FB6h ;# 
# 2384 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PWM1CON equ 0FB7h ;# 
# 2454 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
CCP1CON equ 0FBDh ;# 
# 2551 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
CCPR1 equ 0FBEh ;# 
# 2558 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
CCPR1L equ 0FBEh ;# 
# 2565 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
CCPR1H equ 0FBFh ;# 
# 2572 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADCON2 equ 0FC0h ;# 
# 2643 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADCON1 equ 0FC1h ;# 
# 2728 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADCON0 equ 0FC2h ;# 
# 2868 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADRES equ 0FC3h ;# 
# 2875 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADRESL equ 0FC3h ;# 
# 2882 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADRESH equ 0FC4h ;# 
# 2889 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
T2CON equ 0FCAh ;# 
# 2960 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PR2 equ 0FCBh ;# 
# 2965 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
MEMCON equ 0FCBh ;# 
# 3070 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR2 equ 0FCCh ;# 
# 3077 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
T1CON equ 0FCDh ;# 
# 3182 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR1 equ 0FCEh ;# 
# 3189 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR1L equ 0FCEh ;# 
# 3196 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR1H equ 0FCFh ;# 
# 3203 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCON equ 0FD0h ;# 
# 3330 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
WDTCON equ 0FD1h ;# 
# 3358 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
LVDCON equ 0FD2h ;# 
# 3423 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
OSCCON equ 0FD3h ;# 
# 3506 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
T0CON equ 0FD5h ;# 
# 3583 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR0 equ 0FD6h ;# 
# 3590 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR0L equ 0FD6h ;# 
# 3597 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR0H equ 0FD7h ;# 
# 3604 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
STATUS equ 0FD8h ;# 
# 3675 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR2 equ 0FD9h ;# 
# 3682 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR2L equ 0FD9h ;# 
# 3689 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR2H equ 0FDAh ;# 
# 3696 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PLUSW2 equ 0FDBh ;# 
# 3703 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PREINC2 equ 0FDCh ;# 
# 3710 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTDEC2 equ 0FDDh ;# 
# 3717 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTINC2 equ 0FDEh ;# 
# 3724 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INDF2 equ 0FDFh ;# 
# 3731 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
BSR equ 0FE0h ;# 
# 3738 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR1 equ 0FE1h ;# 
# 3745 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR1L equ 0FE1h ;# 
# 3752 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR1H equ 0FE2h ;# 
# 3759 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PLUSW1 equ 0FE3h ;# 
# 3766 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PREINC1 equ 0FE4h ;# 
# 3773 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTDEC1 equ 0FE5h ;# 
# 3780 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTINC1 equ 0FE6h ;# 
# 3787 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INDF1 equ 0FE7h ;# 
# 3794 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
WREG equ 0FE8h ;# 
# 3806 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR0 equ 0FE9h ;# 
# 3813 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR0L equ 0FE9h ;# 
# 3820 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR0H equ 0FEAh ;# 
# 3827 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PLUSW0 equ 0FEBh ;# 
# 3834 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PREINC0 equ 0FECh ;# 
# 3841 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTDEC0 equ 0FEDh ;# 
# 3848 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTINC0 equ 0FEEh ;# 
# 3855 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INDF0 equ 0FEFh ;# 
# 3862 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INTCON3 equ 0FF0h ;# 
# 3954 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INTCON2 equ 0FF1h ;# 
# 4031 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INTCON equ 0FF2h ;# 
# 4162 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PROD equ 0FF3h ;# 
# 4169 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PRODL equ 0FF3h ;# 
# 4176 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PRODH equ 0FF4h ;# 
# 4183 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TABLAT equ 0FF5h ;# 
# 4192 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TBLPTR equ 0FF6h ;# 
# 4199 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TBLPTRL equ 0FF6h ;# 
# 4206 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TBLPTRH equ 0FF7h ;# 
# 4213 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TBLPTRU equ 0FF8h ;# 
# 4222 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PCLAT equ 0FF9h ;# 
# 4229 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PC equ 0FF9h ;# 
# 4236 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PCL equ 0FF9h ;# 
# 4243 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PCLATH equ 0FFAh ;# 
# 4250 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PCLATU equ 0FFBh ;# 
# 4257 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
STKPTR equ 0FFCh ;# 
# 4363 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TOS equ 0FFDh ;# 
# 4370 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TOSL equ 0FFDh ;# 
# 4377 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TOSH equ 0FFEh ;# 
# 4384 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TOSU equ 0FFFh ;# 
# 52 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PORTA equ 0F80h ;# 
# 244 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PORTB equ 0F81h ;# 
# 492 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
LATA equ 0F89h ;# 
# 594 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
LATB equ 0F8Ah ;# 
# 706 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TRISA equ 0F92h ;# 
# 711 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
DDRA equ 0F92h ;# 
# 908 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TRISB equ 0F93h ;# 
# 913 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
DDRB equ 0F93h ;# 
# 1130 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
OSCTUNE equ 0F9Bh ;# 
# 1188 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PIE1 equ 0F9Dh ;# 
# 1254 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PIR1 equ 0F9Eh ;# 
# 1320 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
IPR1 equ 0F9Fh ;# 
# 1386 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PIE2 equ 0FA0h ;# 
# 1427 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PIR2 equ 0FA1h ;# 
# 1468 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
IPR2 equ 0FA2h ;# 
# 1509 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
EECON1 equ 0FA6h ;# 
# 1575 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
EECON2 equ 0FA7h ;# 
# 1582 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
EEDATA equ 0FA8h ;# 
# 1589 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
EEADR equ 0FA9h ;# 
# 1596 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
BAUDCTL equ 0FAAh ;# 
# 1660 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCSTA equ 0FABh ;# 
# 1665 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCSTA1 equ 0FABh ;# 
# 1870 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TXSTA equ 0FACh ;# 
# 1875 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TXSTA1 equ 0FACh ;# 
# 2126 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TXREG equ 0FADh ;# 
# 2131 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TXREG1 equ 0FADh ;# 
# 2138 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCREG equ 0FAEh ;# 
# 2143 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCREG1 equ 0FAEh ;# 
# 2150 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
SPBRG equ 0FAFh ;# 
# 2155 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
SPBRG1 equ 0FAFh ;# 
# 2162 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
SPBRGH equ 0FB0h ;# 
# 2169 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
T3CON equ 0FB1h ;# 
# 2281 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR3 equ 0FB2h ;# 
# 2288 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR3L equ 0FB2h ;# 
# 2295 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR3H equ 0FB3h ;# 
# 2302 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ECCPAS equ 0FB6h ;# 
# 2384 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PWM1CON equ 0FB7h ;# 
# 2454 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
CCP1CON equ 0FBDh ;# 
# 2551 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
CCPR1 equ 0FBEh ;# 
# 2558 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
CCPR1L equ 0FBEh ;# 
# 2565 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
CCPR1H equ 0FBFh ;# 
# 2572 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADCON2 equ 0FC0h ;# 
# 2643 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADCON1 equ 0FC1h ;# 
# 2728 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADCON0 equ 0FC2h ;# 
# 2868 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADRES equ 0FC3h ;# 
# 2875 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADRESL equ 0FC3h ;# 
# 2882 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
ADRESH equ 0FC4h ;# 
# 2889 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
T2CON equ 0FCAh ;# 
# 2960 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PR2 equ 0FCBh ;# 
# 2965 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
MEMCON equ 0FCBh ;# 
# 3070 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR2 equ 0FCCh ;# 
# 3077 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
T1CON equ 0FCDh ;# 
# 3182 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR1 equ 0FCEh ;# 
# 3189 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR1L equ 0FCEh ;# 
# 3196 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR1H equ 0FCFh ;# 
# 3203 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
RCON equ 0FD0h ;# 
# 3330 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
WDTCON equ 0FD1h ;# 
# 3358 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
LVDCON equ 0FD2h ;# 
# 3423 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
OSCCON equ 0FD3h ;# 
# 3506 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
T0CON equ 0FD5h ;# 
# 3583 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR0 equ 0FD6h ;# 
# 3590 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR0L equ 0FD6h ;# 
# 3597 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TMR0H equ 0FD7h ;# 
# 3604 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
STATUS equ 0FD8h ;# 
# 3675 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR2 equ 0FD9h ;# 
# 3682 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR2L equ 0FD9h ;# 
# 3689 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR2H equ 0FDAh ;# 
# 3696 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PLUSW2 equ 0FDBh ;# 
# 3703 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PREINC2 equ 0FDCh ;# 
# 3710 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTDEC2 equ 0FDDh ;# 
# 3717 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTINC2 equ 0FDEh ;# 
# 3724 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INDF2 equ 0FDFh ;# 
# 3731 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
BSR equ 0FE0h ;# 
# 3738 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR1 equ 0FE1h ;# 
# 3745 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR1L equ 0FE1h ;# 
# 3752 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR1H equ 0FE2h ;# 
# 3759 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PLUSW1 equ 0FE3h ;# 
# 3766 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PREINC1 equ 0FE4h ;# 
# 3773 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTDEC1 equ 0FE5h ;# 
# 3780 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTINC1 equ 0FE6h ;# 
# 3787 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INDF1 equ 0FE7h ;# 
# 3794 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
WREG equ 0FE8h ;# 
# 3806 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR0 equ 0FE9h ;# 
# 3813 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR0L equ 0FE9h ;# 
# 3820 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
FSR0H equ 0FEAh ;# 
# 3827 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PLUSW0 equ 0FEBh ;# 
# 3834 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PREINC0 equ 0FECh ;# 
# 3841 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTDEC0 equ 0FEDh ;# 
# 3848 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
POSTINC0 equ 0FEEh ;# 
# 3855 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INDF0 equ 0FEFh ;# 
# 3862 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INTCON3 equ 0FF0h ;# 
# 3954 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INTCON2 equ 0FF1h ;# 
# 4031 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
INTCON equ 0FF2h ;# 
# 4162 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PROD equ 0FF3h ;# 
# 4169 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PRODL equ 0FF3h ;# 
# 4176 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PRODH equ 0FF4h ;# 
# 4183 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TABLAT equ 0FF5h ;# 
# 4192 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TBLPTR equ 0FF6h ;# 
# 4199 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TBLPTRL equ 0FF6h ;# 
# 4206 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TBLPTRH equ 0FF7h ;# 
# 4213 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TBLPTRU equ 0FF8h ;# 
# 4222 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PCLAT equ 0FF9h ;# 
# 4229 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PC equ 0FF9h ;# 
# 4236 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PCL equ 0FF9h ;# 
# 4243 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PCLATH equ 0FFAh ;# 
# 4250 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
PCLATU equ 0FFBh ;# 
# 4257 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
STKPTR equ 0FFCh ;# 
# 4363 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TOS equ 0FFDh ;# 
# 4370 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TOSL equ 0FFDh ;# 
# 4377 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TOSH equ 0FFEh ;# 
# 4384 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic18f1320.h"
TOSU equ 0FFFh ;# 
	debug_source C
	FNCALL	_main,_GPIO_Init
	FNCALL	_main,_GPIO_SetPinMode
	FNCALL	_main,_GPIO_WritePin
	FNROOT	_main
	global	_LATAbits
_LATAbits	set	0xF89
	global	_TRISAbits
_TRISAbits	set	0xF92
	global	_OSCCON
_OSCCON	set	0xFD3
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config OSC = "INTIO2"
	config WDT = "OFF"
	config MCLRE = "OFF"
	config LVP = "OFF"
	file	"build\main.s"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_GPIO_Init:	; 1 bytes @ 0x0
?_GPIO_SetPinMode:	; 1 bytes @ 0x0
?_GPIO_WritePin:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	GPIO_SetPinMode@mode
GPIO_SetPinMode@mode:	; 1 bytes @ 0x0
	global	GPIO_WritePin@state
GPIO_WritePin@state:	; 1 bytes @ 0x0
??_GPIO_Init:	; 1 bytes @ 0x0
	ds   1
??_GPIO_SetPinMode:	; 1 bytes @ 0x1
??_GPIO_WritePin:	; 1 bytes @ 0x1
	ds   2
	global	GPIO_SetPinMode@pin
GPIO_SetPinMode@pin:	; 1 bytes @ 0x3
	global	GPIO_WritePin@pin
GPIO_WritePin@pin:	; 1 bytes @ 0x3
	ds   1
??_main:	; 1 bytes @ 0x4
	ds   2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          127      6       6
;!    BANK0           128      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_GPIO_SetPinMode
;!    _main->_GPIO_WritePin
;!
;!Critical Paths under _main in BANK0
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0     105
;!                                              4 COMRAM     2     2      0
;!                          _GPIO_Init
;!                    _GPIO_SetPinMode
;!                      _GPIO_WritePin
;! ---------------------------------------------------------------------------------
;! (1) _GPIO_WritePin                                        4     3      1      53
;!                                              0 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (1) _GPIO_SetPinMode                                      4     3      1      52
;!                                              0 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (1) _GPIO_Init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _GPIO_Init
;!   _GPIO_SetPinMode
;!   _GPIO_WritePin
;!

;!Address spaces:

;!Name               Size   Autos  Total    Usage
;!BITCOMRAM          127      0       0      0.0%
;!BITBANK0           128      0       0      0.0%
;!BITBIGSFRh         118      0       0      0.0%
;!BITBIGSFRl           9      0       0      0.0%
;!COMRAM             127      6       6      4.7%
;!BANK0              128      0       0      0.0%
;!BIGRAM             255      0       0      0.0%
;!STACK                0      0       0      0.0%
;!DATA                 0      0       6      0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "app\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          2       0
;;      Totals:         2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_GPIO_Init
;;		_GPIO_SetPinMode
;;		_GPIO_WritePin
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"app\main.c"
	line	6
global __ptext0
__ptext0:
psect	text0
	file	"app\main.c"
	line	6
	
_main:
;incstack = 0
	callstack 30
	line	9
	
l785:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	12
	
l787:
	call	_GPIO_Init	;wreg free
	line	16
	
l789:
	movlw	low(0)
	movwf	((c:GPIO_SetPinMode@mode))^00h,c
	movlw	(0)&0ffh
	
	call	_GPIO_SetPinMode
	line	23
	
l791:
	movlw	low(01h)
	movwf	((c:GPIO_WritePin@state))^00h,c
	movlw	(0)&0ffh
	
	call	_GPIO_WritePin
	line	24
	
l793:
	asmopt push
asmopt off
movlw  11
movwf	(??_main+0+0+1)^00h,c
movlw	38
movwf	(??_main+0+0)^00h,c
	movlw	94
u77:
decfsz	wreg,f
	bra	u77
	decfsz	(??_main+0+0)^00h,c,f
	bra	u77
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u77
asmopt pop

	line	25
	
l795:
	movlw	low(0)
	movwf	((c:GPIO_WritePin@state))^00h,c
	movlw	(0)&0ffh
	
	call	_GPIO_WritePin
	line	26
	
l797:
	asmopt push
asmopt off
movlw  11
movwf	(??_main+0+0+1)^00h,c
movlw	38
movwf	(??_main+0+0)^00h,c
	movlw	94
u87:
decfsz	wreg,f
	bra	u87
	decfsz	(??_main+0+0)^00h,c,f
	bra	u87
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u87
asmopt pop

	goto	l791
	global	start
	goto	start
	callstack 0
	line	28
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_GPIO_WritePin

;; *************** function _GPIO_WritePin *****************
;; Defined at:
;;		line 26 in file "hal\hal_pic18f.c"
;; Parameters:    Size  Location     Type
;;  pin             1    wreg     enum E2
;;  state           1    0[COMRAM] enum E9
;; Auto vars:     Size  Location     Type
;;  pin             1    3[COMRAM] enum E2
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0
;;      Params:         1       0
;;      Locals:         1       0
;;      Temps:          2       0
;;      Totals:         4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	file	"hal\hal_pic18f.c"
	line	26
global __ptext1
__ptext1:
psect	text1
	file	"hal\hal_pic18f.c"
	line	26
	
_GPIO_WritePin:
;incstack = 0
	callstack 30
	movwf	((c:GPIO_WritePin@pin))^00h,c
	line	28
	
l775:
	goto	l779
	line	29
	
l35:
	line	30
	btfsc	(c:GPIO_WritePin@state)^00h,c,0
	bra	u65
	bcf	((c:3977))^0f00h,c,1	;volatile
	bra	u66
	u65:
	bsf	((c:3977))^0f00h,c,1	;volatile
	u66:

	line	31
	goto	l37
	line	32
	
l779:
	movf	((c:GPIO_WritePin@pin))^00h,c,w
	movwf	(??_GPIO_WritePin+0+0)^00h,c
	clrf	(??_GPIO_WritePin+0+0+1)^00h,c

	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "simple"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
;	Chosen strategy is simple_byte

	movf ??_GPIO_WritePin+0+1^00h,c,w
	xorlw	0^0	; case 0
	skipnz
	goto	l807
	goto	l37
	
l807:
; Switch size 1, requested type "simple"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
;	Chosen strategy is simple_byte

	movf ??_GPIO_WritePin+0+0^00h,c,w
	xorlw	0^0	; case 0
	skipnz
	goto	l35
	goto	l37

	line	33
	
l37:
	return	;funcret
	callstack 0
GLOBAL	__end_of_GPIO_WritePin
	__end_of_GPIO_WritePin:
	signat	_GPIO_WritePin,8313
	global	_GPIO_SetPinMode

;; *************** function _GPIO_SetPinMode *****************
;; Defined at:
;;		line 17 in file "hal\hal_pic18f.c"
;; Parameters:    Size  Location     Type
;;  pin             1    wreg     enum E2
;;  mode            1    0[COMRAM] enum E5
;; Auto vars:     Size  Location     Type
;;  pin             1    3[COMRAM] enum E2
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0
;;      Params:         1       0
;;      Locals:         1       0
;;      Temps:          2       0
;;      Totals:         4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	17
global __ptext2
__ptext2:
psect	text2
	file	"hal\hal_pic18f.c"
	line	17
	
_GPIO_SetPinMode:
;incstack = 0
	callstack 30
	movwf	((c:GPIO_SetPinMode@pin))^00h,c
	line	19
	
l763:
	goto	l769
	line	21
	
l765:
		decf	((c:GPIO_SetPinMode@mode))^00h,c,w
	btfsc	status,2
	goto	u41
	goto	u40

u41:
	clrf	(??_GPIO_SetPinMode+0+0)^00h,c
	incf	(??_GPIO_SetPinMode+0+0)^00h,c
	goto	u58
u40:
	clrf	(??_GPIO_SetPinMode+0+0)^00h,c
u58:
	rlncf	(??_GPIO_SetPinMode+0+0)^00h,c
	movf	((c:3986))^0f00h,c,w	;volatile
	xorwf	(??_GPIO_SetPinMode+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_GPIO_SetPinMode+0+0)^00h,c,w
	movwf	((c:3986))^0f00h,c	;volatile
	line	22
	goto	l31
	line	23
	
l769:
	movf	((c:GPIO_SetPinMode@pin))^00h,c,w
	movwf	(??_GPIO_SetPinMode+0+0)^00h,c
	clrf	(??_GPIO_SetPinMode+0+0+1)^00h,c

	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "simple"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
;	Chosen strategy is simple_byte

	movf ??_GPIO_SetPinMode+0+1^00h,c,w
	xorlw	0^0	; case 0
	skipnz
	goto	l809
	goto	l31
	
l809:
; Switch size 1, requested type "simple"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
;	Chosen strategy is simple_byte

	movf ??_GPIO_SetPinMode+0+0^00h,c,w
	xorlw	0^0	; case 0
	skipnz
	goto	l765
	goto	l31

	line	24
	
l31:
	return	;funcret
	callstack 0
GLOBAL	__end_of_GPIO_SetPinMode
	__end_of_GPIO_SetPinMode:
	signat	_GPIO_SetPinMode,8313
	global	_GPIO_Init

;; *************** function _GPIO_Init *****************
;; Defined at:
;;		line 13 in file "hal\hal_pic18f.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	line	13
global __ptext3
__ptext3:
psect	text3
	file	"hal\hal_pic18f.c"
	line	13
	
_GPIO_Init:
;incstack = 0
	callstack 30
	line	15
	
l25:
	return	;funcret
	callstack 0
GLOBAL	__end_of_GPIO_Init
	__end_of_GPIO_Init:
	signat	_GPIO_Init,89
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	db 0	; dummy byte at the end
	global	__smallconst
__smallconst	set	__psmallconst
	global	__mediumconst
__mediumconst	set	__psmallconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
