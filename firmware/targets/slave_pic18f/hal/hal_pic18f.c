// File: hal_pic18f.c
// Role: Implements ALL generic HAL functions specifically for the PIC18F platform.

#include "../../../common/hal/hal_gpio.h" // Using relative paths for clarity
#include "../../../common/hal/hal_uart.h"
#include "config.h"
#include <xc.h>

// =============================================================================
// --- GPIO Implementation ---
// =============================================================================

void GPIO_Init(void) {
    // We could put default pin initializations here if needed.
}

void GPIO_SetPinMode(gpio_pin_t pin, gpio_mode_t mode) {
    // Your working GPIO mode code goes here...
    switch(pin) {
        case STATUS_LED_PIN:
            TRISAbits.TRISA1 = (mode == GPIO_MODE_INPUT); 
            break;
    }
}

void GPIO_WritePin(gpio_pin_t pin, gpio_state_t state) {
    // Your working GPIO write code goes here...
    switch(pin) {
        case STATUS_LED_PIN:
            LATAbits.LATA1 = (unsigned char)state;
            break;
    }
}


// =============================================================================
// --- UART Implementation ---
// =============================================================================
// As you add features, you will add the UART implementation code here.

void hal_uart_init(void) {
    // PIC-specific UART initialization code...
}

void hal_uart_transmit(char data) {
    // PIC-specific UART transmit code...
}

// ...and so on.