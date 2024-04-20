#ifndef HAL_H
#define HAL_H

#include <stdint.h>
#include <avr/io.h>

#define HSYNC_bm 0b00000001
#define DE_bm 0b00000010
#define CS_bm 0b00000100
#define VSYNC_bm 0b00001000

#define INIT_CMD_ADDR 0x10
#define BRIGHTNESS_CMD_ADDR 0x14

void init_HAL(void);
void init_32Mhzclock(void);
void init_SPI(SPI_t *spi_module);
void init_io(void);

uint8_t SPI_read_byte(SPI_t *spi_module);
void SPI_write_byte(SPI_t *spi_module, uint8_t data);
void SPI_write_data(SPI_t *spi_module, uint8_t *data, uint16_t size);

void LCD_cmd(SPI_t *spi_module, uint8_t addr, uint8_t cmd);

typedef struct LCD_screen {
    SPI_t *spi_module;
    uint8_t buf[1024];
} LCD_screen;

typedef struct camera {
    SPI_t *spi_module;
    uint8_t buf[1024];
} camera;

#endif
