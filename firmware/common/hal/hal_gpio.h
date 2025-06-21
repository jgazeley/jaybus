#ifndef HAL_GPIO_H
#define HAL_GPIO_H

// This file defines a generic, universal way to refer to our hardware pins.
// The main application will only use these generic names.

// 1. Create a generic name for the physical pin we are using.
typedef enum {
    STATUS_LED_PIN // Our only pin for this example
} gpio_pin_t;

// 2. Create generic names for pin modes (direction).
typedef enum { 
    GPIO_MODE_OUTPUT, 
    GPIO_MODE_INPUT 
} gpio_mode_t;

// 3. Create generic names for pin states (voltage level).
typedef enum { 
    GPIO_STATE_LOW = 0, 
    GPIO_STATE_HIGH = 1 
} gpio_state_t;

// 4. Declare the public functions that our application can use.
//    The actual code for these functions is in the .c file.
void GPIO_Init(void);
void GPIO_SetPinMode(gpio_pin_t pin, gpio_mode_t mode);
void GPIO_WritePin(gpio_pin_t pin, gpio_state_t state);

#endif // HAL_GPIO_H