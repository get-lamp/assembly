#include <avr/io.h>
#include <util/delay.h>


int main (void) {
    static const uint16_t MS_DELAY = 1000;

    // Set PortB pin 4 direction to output
    DDRB |= (1 << DDB4);

    // Set to low
    PORTB &= ~(1 << PB4);

    while (1) {
        // XOR pin 4
        PORTB ^= (1<<PB4);

        // wait
        _delay_ms(MS_DELAY);
    }

    return 0;
}
