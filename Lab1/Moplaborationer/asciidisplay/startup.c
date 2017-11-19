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
#define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste man ha offset 15*/

#define B_E 0x40
#define B_SELECT 4
#define B_RW 2
#define B_RS 1 

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

void main(void)
{
    char *s;
    char test1[] =
}
void delay_250ns(void){
    
*STK_CTRL = 0;
*STK_LOAD = ( (168/4) -1 );
*STK_VAL = 0;
*STK_CTRL = 5;

 while( (*STK_CTRL & 0x10000 )== 0 )
 {}
 *STK_CTRL = 0; 
    }
void delay_mikro(unsigned int us){
    
     while(us--) {
     delay_250ns();
     delay_250ns();
     delay_250ns();
     delay_250ns();
    }
 }
void delay_milli(unsigned int ms){
    
   #ifdef SIMULATOR
while( ms-- )
 delay_mikro(1);
#else
while( ms-- )
 delay_mikro(1);// ska vara 1000
#endif
    }
void ascii_ctrl_bit_set( unsigned char x )
{ /* Funktion för att 1-ställa bitar */
unsigned char c;

c = *GPIOE_ODR_LOW;
c |= ( B_SELECT | x );
*GPIOE_ODR_LOW = c;
}

void ascii_ctrl_bit_clear( unsigned char x )
{
unsigned char c;
c = *GPIOE_ODR_LOW;
c = B_SELECT | ( c & ~x );
*GPIOE_ODR_LOW = c;
} 


void ascii_write_cmd(unsigned char c)
{
    ascii_ctrl_bit_clear(B_RS | B_RW);    // "|" = bitvis eller
    ascii_write_controller(c);
}
void ascii_write_controller( unsigned char c )
{
ascii_ctrl_bit_set( B_E );
*GPIOE_ODR_HIGH = c;
delay_250ns();
ascii_ctrl_bit_clear( B_E );
}
unsigned char ascii_read_controller( void )
{
unsigned char c;
ascii_ctrl_bit_set( B_E );
delay_250ns(); /* max 360 ns */
delay_250ns();
c = *GPIOE_IDR_HIGH;
ascii_ctrl_bit_clear( B_E );
return c;
} 