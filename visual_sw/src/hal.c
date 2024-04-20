#include "hal.h"
#include <stdint.h>
#include <avr/io.h>

void init_HAL(void) {
    init_32Mhzclock();
    init_io();
    init_SPI(&SPID);
}


//               32Mhz internal RC oscillator initalization
void init_32Mhzclock(void) {
//setup clock for 32Mhz RC internal oscillator
  OSC.CTRL = OSC_RC32MEN_bm; // enable 32MHz clock
  while (!(OSC.STATUS & OSC_RC32MRDY_bm)); // wait for clock to be ready
  CCP = CCP_IOREG_gc; // enable protected register change
  CLK.CTRL = CLK_SCLKSEL_RC32M_gc; // switch to 32MHz clock
}


void init_io(void) {
  PORTD.DIRSET  |= 0b10110000; //configure SPI pins on port D    
  PORTD.DIRSET |= (HSYNC_bm | DE_bm | CS_bm | VSYNC_bm);
}


// Initalize Port D SPI 
void init_SPI(SPI_t *spi_module) {
  // spi_module -> CTRL     |= SPI_CLK2X_bm | SPI_ENABLE_bm | SPI_MASTER_bm; //setup SPI   
  spi_module -> CTRL     |= SPI_ENABLE_bm | SPI_MASTER_bm | 0b00000011; //setup SPI   
  spi_module -> INTCTRL  = 0x00; //no interrupts                
}


uint8_t SPI_read_byte(SPI_t *spi_module) {
  uint16_t ctr = 0, retval;

  spi_module -> DATA = 0x00;

  while (!(spi_module -> STATUS & 0b10000000) && (ctr < 65000)) ctr++;

  retval = spi_module -> DATA;

  return retval;
}


void SPI_write_byte(SPI_t *spi_module, uint8_t data) {
  uint16_t ctr = 0;

  spi_module -> DATA = data; 
  while (!(spi_module -> STATUS & 0b10000000)) ctr++;
}


void SPI_write_data(SPI_t *spi_module, uint8_t *data, uint16_t size) {
  uint8_t ctr;

  for (uint16_t i = 0; i < size; i++) {
    spi_module -> DATA = data[i]; 
    ctr = 0;
    while (!(spi_module -> STATUS & 0b10000000) && (ctr < 100)) ctr++;
  }
}


void LCD_cmd(SPI_t *spi_module, uint8_t addr, uint8_t cmd) {
  PORTD.OUT &= ~CS_bm;
  SPI_write_byte(spi_module, addr);
  SPI_write_byte(spi_module, cmd);
  PORTD.OUT |= CS_bm;
}
