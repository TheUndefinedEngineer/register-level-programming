#include <stdint.h>

int main(void)
{
	//Register addresses
	volatile uint32_t * const RCC_AHB1ENR = (volatile uint32_t *)(0x40023800 + 0x30);
	volatile uint32_t * const GPIOC_MODER = (volatile uint32_t *)(0x40020800);
	volatile uint32_t * const GPIOC_OSPEEDR = (volatile uint32_t *)(0x40020800 + 0x08);
	volatile uint32_t * const GPIOC_PUPDR = (volatile uint32_t *)(0x40020800 + 0x0C);
	volatile uint32_t * const GPIOC_BSRR = (volatile uint32_t *)(0x40020800 + 0x18);

	*RCC_AHB1ENR |= (1 << 2); //Enabling GPIOC
	*GPIOC_MODER = (*GPIOC_MODER & ~(0x03 << 26)) | (0x01 << 26);
	*GPIOC_OSPEEDR = (*GPIOC_OSPEEDR & ~(0x03 << 26)) | (0x01 << 26);
	*GPIOC_PUPDR = (*GPIOC_PUPDR & ~(0x03 << 26)) | (0x00 << 26);
	
	while(1){
		*GPIOC_BSRR |= (1 << 13);
		for(volatile int i = 0; i < 100000; i++);
		*GPIOC_BSRR |= (1 << (13+16));
		for(volatile int i = 0; i < 100000; i++);
	}
		
	return 0;
}
