#ifndef CONFIG_H
#define CONFIG_H

// This file contains the chip's core configuration settings,
// also known as "fuses," which are set when the chip is programmed.

// --- CONFIGURATION BITS ---
#pragma config OSC = INTIO2      // Use the internal oscillator block
#pragma config WDT = OFF         // Watchdog Timer is disabled
#pragma config MCLRE = OFF       // Master Clear Reset pin is disabled
#pragma config LVP = OFF         // Low-Voltage Programming is disabled

// --- GLOBAL DEFINITIONS ---
// Define the system clock frequency for the compiler's delay functions.
// This must match the speed set by the OSCCON register in main.c.
#define _XTAL_FREQ 8000000 

#endif // CONFIG_H