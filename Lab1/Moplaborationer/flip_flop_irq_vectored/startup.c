/*
 * 	startup.c
 *
 */
 #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
#define	GPIO_D			0x40020C00
#define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
#define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 bytes vilket är 16 bitar.*/
#define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO behöver*/
#define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
#define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
#define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste man ha offset 11*/
#define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
#define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste man ha offset 15*/

#define	GPIO_E			0x40021000
#define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
#define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 bytes vilket är 16 bitar.*/
#define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO behöver*/
#define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
#define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
#define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste man ha offset 11*/
#define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
#define GPIO_E_OUTPUT	((volatile unsigned char *)		(GPIO_E+0x14))
#define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste man ha offset 15*/

 #define	RCC			((volatile unsigned int *) 0x40023844)
 
#define SYSCFG_EXTICR1	0x40013808
#define EXTI_IMR	0x40013C00
#define EXTI_FTSR	0x40013C0C
#define EXTI_PR	0x40013C14
#define NVIC_ISER0	0xE000E100
//EXTI3
#define EXTI3_IRQ_BPOS	(1<<3)
#define EXTI3_IRQVEC	0x2001C064
#define NVIC_EXTI3_IRQ_BPOS	(1<<9)

//EXTI2
#define EXTI2_IRQ_BPOS	(1<<2)
#define EXTI2_IRQVEC	0x2001C060
#define NVIC_EXTI2_IRQ_BPOS	(1<<8)

//EXTI1
#define EXTI1_IRQ_BPOS	(1<<1)
#define EXTI1_IRQVEC	0x2001C05c
#define NVIC_EXTI1_IRQ_BPOS	(1<<7)

//EXTI0
#define EXTI0_IRQ_BPOS	(1<<0)
#define EXTI0_IRQVEC	0x2001C058
#define NVIC_EXTI0_IRQ_BPOS	(1<<6)


#define B_E 0x40 // Enable
#define B_RST 0x20 // Reset
#define B_CS2 0x10 // Controller Select 2
#define B_CS1 8 // Controller Select 1
#define B_SELECT 4 // 0 Graphics, 1 ASCII
#define B_RW 2 // 0 Write, 1 Read
#define B_RS 1 // 0 Command, 1 Data

#define LCD_ON 0x3F // Display on
#define LCD_OFF 0x3E // Display off
#define LCD_SET_ADD 0x40 // Set horizontal coordinate
#define LCD_SET_PAGE 0xB8 // Set vertical coordinate
#define LCD_DISP_START 0xC0 // Start address
#define LCD_BUSY 0x80 // Read busy status

static volatile int c = 0;
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
	"_exit: B .\n"				/* never return */
	) ;
}
void irq_handler ( void )
{
	*GPIOD_ODR_LOW  = 0xFF;
	if(   *((unsigned int *) EXTI_PR) & EXTI3_IRQ_BPOS )
	{
        c++;
       *((unsigned int *) EXTI_PR) |= EXTI3_IRQ_BPOS;
 	}
    *((unsigned int *) EXTI_PR) |= EXTI3_IRQ_BPOS;
		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
}
void irq_handler2 ( void )
{
	*GPIOD_ODR_LOW  = 0xFF;
	if(   *((unsigned int *) EXTI_PR) & EXTI2_IRQ_BPOS )
	{
        lightUp();
       *((unsigned int *) EXTI_PR) |= EXTI2_IRQ_BPOS;
 	}
    *((unsigned int *) EXTI_PR) |= EXTI2_IRQ_BPOS;
		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
}
void irq_handler1 ( void )
{
	*GPIOD_ODR_LOW  = 0xFF;
	if(   *((unsigned int *) EXTI_PR) & EXTI1_IRQ_BPOS )
	{
        c = 0;
       *((unsigned int *) EXTI_PR) |= EXTI1_IRQ_BPOS;
 	}
    *((unsigned int *) EXTI_PR)|= EXTI1_IRQ_BPOS;
		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
}
void irq_handler0 ( void )
{
	*GPIOD_ODR_LOW  = 0xFF;
	if(   *((unsigned int *) EXTI_PR) & EXTI0_IRQ_BPOS )
	{
        c++;
       *((unsigned int *) EXTI_PR) |= EXTI0_IRQ_BPOS;
 	}
    *((unsigned int *) EXTI_PR) |= EXTI0_IRQ_BPOS;
		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
}

void init_app( void )
{   
  
  *GPIOD_MODER = 0x55555555;
	/*sätter våra in och ut portar*/
	*GPIOD_OTYPER = 0x70;
	*GPIOD_PUPDR = 0x0AA;
	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
    
    
  // port 0-7 -> Keypad
    *GPIOE_MODER = 0x00005500;
	
    //OTYPER bits 15-8 to push-pull
    *GPIOE_OTYPER = 0x0000; //00000000
	
	//OSPEEDR high
    *GPIOE_OSPEDER = 0x55555555; //00000000
	
    //PUPDR bits 23-16 to pull-down, rest to zero
    *GPIOE_PUPDR = 0x00000000; //10101010 000000000 000000000
	
	//Activate clock for SYSCFG
	*RCC |= 0x4000;

	/* Koppla PE0 till avbrottslina EXTI0 */
  	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x0004;
	/* Konfigurera EXTI3 för att generera avbrott */
  	 *((unsigned int *) EXTI_IMR) |= EXTI0_IRQ_BPOS;
	/* Konfigurera för avbrott på negativ flank */
 	 *((unsigned int *) EXTI_FTSR) |= EXTI0_IRQ_BPOS;		
	/* Sätt upp avbrottsvektor */
  	 *((void (**)(void) ) EXTI0_IRQVEC ) = irq_handler0;     
   	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI3 kopplats till */
     *((unsigned int *) NVIC_ISER0) |= NVIC_EXTI0_IRQ_BPOS; 
     
     
     /* Koppla PE1 till avbrottslina EXTI1 */
  	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x0040;
	/* Konfigurera EXTI3 för att generera avbrott */
  	 *((unsigned int *) EXTI_IMR) |= EXTI1_IRQ_BPOS;
	/* Konfigurera för avbrott på negativ flank */
 	 *((unsigned int *) EXTI_FTSR) |= EXTI1_IRQ_BPOS;		
	/* Sätt upp avbrottsvektor */
  	 *((void (**)(void) ) EXTI1_IRQVEC ) = irq_handler1;     
   	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI3 kopplats till */
     *((unsigned int *) NVIC_ISER0) |= NVIC_EXTI1_IRQ_BPOS; 
     
     
     /* Koppla PE2 till avbrottslina EXTI2 */
  	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x0400;
	/* Konfigurera EXTI3 för att generera avbrott */
  	 *((unsigned int *) EXTI_IMR) |= EXTI2_IRQ_BPOS;
	/* Konfigurera för avbrott på negativ flank */
 	 *((unsigned int *) EXTI_FTSR) |= EXTI2_IRQ_BPOS;		
	/* Sätt upp avbrottsvektor */
  	 *((void (**)(void) ) EXTI2_IRQVEC ) = irq_handler2;     
   	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI3 kopplats till */
     *((unsigned int *) NVIC_ISER0) |= NVIC_EXTI2_IRQ_BPOS; 
}
void main(void)
{
    init_app();
    while(1){
        *GPIOD_ODR_LOW = c;
        //c++;
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


