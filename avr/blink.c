#include <avr/io.h>
#include <util/delay.h>

int main (void) {
    const int msDelay = 50;

    // Set PortB pin 4 direction to output
    DDRB = 1<<DDB4;

    PORTB = 0;

    while (1) {
        // XOR pin 4
        PORTB ^= 1<<PB4;

        // wait
        _delay_ms(msDelay);
    }

    return 0;
}
