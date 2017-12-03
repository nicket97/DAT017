
/*
 * 	startup.c
 *
 */

 #define	GPIO_D		0x40020C00
 #define	GPIO_D_ODR ((volatile unsigned char *)  0x40020C14)
 #define    HexDisplay	((volatile unsigned char*) GPIO_D+0x14)
 #define    portModer	((volatile unsigned int *) GPIO_D)
 
 #define	GPIO_E			0x40021000
 #define	GPIO_E_MODER	0x40021000
 #define	GPIO_E_OTYPER	0x40021004
 #define	GPIO_E_OSPEEDR	0x40021008
 #define	GPIO_E_PUPDR	0x4002100C
 #define	GPIO_E_INPUT	0x40021010
 #define	GPIO_E_OUTPUT	0x40021014
 #define    FLIPFLOP	((volatile unsigned char*) GPIO_E+0x10)
 
 #define	EXTI3_IRQ_BPOS 8
 #define	EXTICR_BASE	0x40013800
 #define	SYSCFG_EXTICR1	((volatile unsigned int *) (EXTICR_BASE + 8))
 #define	EXTI_PR		((volatile unsigned int *) 0x40013C14)
 #define	RCC			((volatile unsigned int *) 0x40023844)
 
 #define	SYS_TICK	0xE000E010
 #define	STK_CTRL	((volatile unsigned int *)SYS_TICK)
 #define	STK_LOAD    ((volatile unsigned int *)(0xE000E014))
 #define	STK_VAL     ((volatile unsigned int *)(0xE000E018))
 
 #define	DELAY_COUNT	1000000
 
 unsigned char count;
 char systick_flag;
 char isOn = 0;
 
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

void irq_handler(void){
	*GPIO_D_ODR = 0xFF;
    if ((*EXTI_PR & EXTI3_IRQ_BPOS ) != 0)
    {
		if((*FLIPFLOP & 1) != 0){
			count++;
		}
		
		if((*FLIPFLOP & 2) != 0){
			count = 0;
		}
		
		if((*FLIPFLOP & 4) != 0){
			lightUp();
		}
		
		*EXTI_PR |= EXTI3_IRQ_BPOS;
		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
    }
}

void systick_irq_handler(void){
	*STK_CTRL = 0;
	systick_flag = 1;
}

void init_app(void){
	//Output to 0-7 GPIO_D
	*portModer = 0x00005555;
	
	// port 0-7 -> Keypad
    *( (unsigned long *) GPIO_E_MODER) = 0x00005500;
	
    //OTYPER bits 15-8 to push-pull
    *( (unsigned short *) GPIO_E_OTYPER) = 0x0000; //00000000
	
	//OSPEEDR high
	*( (unsigned short *) GPIO_E_OSPEEDR) = 0x55555555; //00000000
	
    //PUPDR bits 23-16 to pull-down, rest to zero
    *( (unsigned long *) GPIO_E_PUPDR) = 0x00000000; //10101010 000000000 000000000
	
	//Activate clock for SYSCFG
	*RCC |= 0x4000;
	
	//koppla PE3 till avbrottslina EXTI3
	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xFFF;
	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
	
	//konfigurera EXTI3 för att generera avbrott
	//konfigurera för avbrott på negative flank
	*((unsigned int *) 0x40013C00) |= 8;
	*((unsigned int *) 0x40013C0C) |= 8;
	
	//sätt upp avbrottsvektor
	*((void (**) (void) ) 0x2001C064 ) = irq_handler;
	//*((void (**) (void) ) 0x2001C03C ) = systick_irq_handler;
	
	//konfigurera de bitar i NVIC som kontrollerar den avbrottslina som EXTI3 kopplas till
	//enable_interrupt();
	*((unsigned int *) 0xE000E100) |= (1<<9);
	
	count = 0;
}

void delay_250ns(void){
	//*((void (**)(void)) 0x2001C03C) = systick_irq_handler;
    systick_flag = 0;
    *STK_CTRL = 0;
    *STK_LOAD = (168/4)-1;
    *STK_VAL = 0;
    *STK_CTRL = 7;
}

void delay(unsigned int count){
	for(int i = 0; i < count; i++){
		delay_250ns();
		while(systick_flag == 0);
	}
}

void lightUp(void){
	if (isOn == 0){
		count = 0xFF;
		isOn = 1;
	} else{
		count = 0;
		isOn = 0;
	}
}

void main(void)
{
	init_app();
	
	while(1){
		*HexDisplay = count;
	}
}
