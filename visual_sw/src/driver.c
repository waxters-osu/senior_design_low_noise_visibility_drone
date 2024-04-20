//x_siren.c
//one timeer creates the tone in freq generation mode
//one timer creates an interrupt to update the setting for frequency
//another timer creates the pwm signal for the volume control

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdlib.h>

#include "hal.h"
// #include "visuals.h"

LCD_screen scr;
camera cam;


// PORTD:   CLK | MISO | MOSI | X | VSYNC | CS | DE | HSYNC

int main() {
  init_HAL();

  _delay_ms(500);
  LCD_cmd(&SPID, INIT_CMD_ADDR, 0);

  _delay_ms(100);
  LCD_cmd(&SPID, INIT_CMD_ADDR, 0b00001001);
  LCD_cmd(&SPID, BRIGHTNESS_CMD_ADDR, 0xFF);

  PORTD.OUT |= (HSYNC_bm | VSYNC_bm);


  while (1) {
    /*
    PORTD.OUT &= ~VSYNC_bm;
    PORTD.OUT |= VSYNC_bm;
    */


    for (uint16_t i = 0; i < 480; i++) {
      PORTD.OUT &= ~HSYNC_bm;
      _delay_us(1);
      PORTD.OUT |= HSYNC_bm;

      PORTD.OUT |= DE_bm;
      _delay_us(60);
      PORTD.OUT &= ~DE_bm;
    }
  }
} 
