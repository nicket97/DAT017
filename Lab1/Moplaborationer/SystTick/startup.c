/*
 * 	startup.c
 *
 */
#define DELAY_COUNT 100

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

static volatile int systick_flag;
static volatile int delay_count;
//Hårdvara
//#define DELAY_COUNT 100000
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
void systick_irq_handler(void){
    *STK_CTRL = 0;
    delay_count --;
    if(delay_count > 0)
        delay_1mikro();
    else
        systick_flag = 1;
    systick_flag = 1;
    }
void init_app(void){
     *GPIOE_MODER = 0x55555555;
	/*sätter våra in och ut portar*/
	//*GPIOE_OTYPER = 0x70;
	//*GPIOE_PUPDR = 0x0AA;
	//*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
    
    *GPIOD_MODER = 0x55005555;
	/*sätter våra in och ut portar*/
	*GPIOD_OTYPER = 0x70;
	*GPIOD_PUPDR = 0x0AA;
	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
    *((void (**) (void)) 0x2001c03c) = systick_irq_handler;
    }
void main(void)
{
    init_app();
    int c = 0;
    *GPIOE_ODR_LOW = 0x00;
    delay(DELAY_COUNT);
    *GPIOE_ODR_LOW = 0xFF;
    while(1){
        if(systick_flag){
            break;
            }
            c++;
        }
    *GPIOE_ODR_LOW = 0;
}
void delay_1mikro(void){
    *STK_CTRL = 0;
    *STK_LOAD = (168 -1);
    *STK_VAL = 0;
    *STK_CTRL = 7;
    }
void delay(unsigned int count)
{
    if(count == 0)
        return;
        delay_count = count;
        systick_flag = 0;
        delay_1mikro();
    }
