#include "../hal/config.h"   // Includes our chip configuration

#include <xc.h>       // Still needed for __delay_ms()
#include "../../../common/hal/hal_gpio.h" // Includes our generic GPIO functions

void main(void) {
    // --- SETUP ---
    // Configure the internal oscillator to run at the speed we defined in config.h
    OSCCON = 0b01110000;    // Sets internal oscillator to 8 MHz

    // Initialize our GPIO abstraction layer.
    GPIO_Init();
    
    // Set the pin mode for our LED using our generic, readable function.
    // Notice there are no TRIS registers here!
    GPIO_SetPinMode(STATUS_LED_PIN, GPIO_MODE_OUTPUT);

    // --- MAIN LOOP ---
    while (1) {
        // Control the LED using our generic functions.
        // The main loop doesn't know or care about LAT registers.
        // It just knows how to turn the status LED ON or OFF.
        GPIO_WritePin(STATUS_LED_PIN, GPIO_STATE_HIGH); // LED ON
        __delay_ms(1000);
        GPIO_WritePin(STATUS_LED_PIN, GPIO_STATE_LOW);  // LED OFF
        __delay_ms(1000);
    }
}