/*
 * 	startup.c
 *
 */
 typedef unsigned char uint8_t;
 
#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
#define	GPIO_D			0x40020C00
#define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes r 32 bitar*/
#define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper annder 2 bytes vilket r 16 bitar.*/
#define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC sger vilken offset GPIO behver*/
#define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
#define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
#define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high mste man ha offset 11*/
#define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
#define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high mste man ha offset 15*/

#define	GPIO_E			0x40021000
#define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes r 32 bitar*/
#define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper annder 2 bytes vilket r 16 bitar.*/
#define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC sger vilken offset GPIO behver*/
#define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
#define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
#define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high mste man ha offset 11*/
#define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
#define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high mste man ha offset 15*/


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
void init_app(void){
    *GPIOE_MODER = 0x55555555;
	/*stter vra in och ut portar*/
	//*GPIOE_OTYPER = 0x70;
	//*GPIOE_PUPDR = 0x0AA;
	//*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
    }
void main(void)
{
   init_app();
    graphic_initialize();
    graphic_clear_screen();
for(int i = 0; i < 128; i++){
    pixel(i,10,1);
    }
for(int i = 0; i < 64; i++){
    pixel(10,i,1);
    }
delay_milli(500);
for(int i = 0; i < 128; i++){
    pixel(i,10,0);
    }
for(int i = 0; i < 64; i++){
    pixel(10,i,0);
    }
    
}

void delay_250ns(void)
{
    *STK_CTRL = 0;
    *STK_LOAD = (168/4)-1;   // minst 500 ns
    *STK_VAL = 0;
    *STK_CTRL = 5;
    while((* STK_CTRL & 0x10000) == 0) ;
    *STK_CTRL = 0;
}


void delay_mikro(unsigned int us)
{
#ifdef   SIMULATOR
    us = us / 1000;
    us++;
#endif
    while(us < 0){
        {
            delay_250ns();
            delay_250ns();
            delay_250ns();
            delay_250ns();
            us--;
        }
    }
}

void delay_milli(unsigned ms)
{

    ms = ms/1000;// simulator onely
    ms++;//simulator

    while(ms > 0){
        {
            delay_mikro(1000);
            ms--;
            
        }
    }
}
void delay_500ns(void){
    delay_250ns();
    delay_250ns();
    }
static void graphic_ctrl_bit_set(uint8_t x) {
uint8_t c;
c = *GPIOE_ODR_LOW;
c &= ~B_SELECT;
c |= (~B_SELECT & x);
*GPIOE_ODR_LOW = c;
}
static void graphic_ctrl_bit_clear(uint8_t x) {
uint8_t c;
c = *GPIOE_ODR_LOW;
c &= ~B_SELECT;
c &= ~x;
*GPIOE_ODR_LOW = c;
}
static void select_controller(uint8_t controller){
    switch(controller){
    case 0:
    graphic_ctrl_bit_clear(B_CS1|B_CS2);
    break;
    case B_CS1 :
    graphic_ctrl_bit_set(B_CS1);
    graphic_ctrl_bit_clear(B_CS2);
    break;
    case B_CS2 :
    graphic_ctrl_bit_set(B_CS2);
    graphic_ctrl_bit_clear(B_CS1);
    break;
    case B_CS1|B_CS2 :
    graphic_ctrl_bit_set(B_CS1|B_CS2);
    break;
}
}
void graphic_initialize(void) {
graphic_ctrl_bit_set(B_E);
delay_mikro(10);
graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
delay_milli(30);
graphic_ctrl_bit_set(B_RST);
delay_milli(100);
graphic_write_command(LCD_OFF, B_CS1|B_CS2);
graphic_write_command(LCD_ON, B_CS1|B_CS2);
graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
select_controller(0);
}
static void graphic_wait_ready(void) {
uint8_t c;
graphic_ctrl_bit_clear(B_E);
// 15-8 inputs, 7-0 outputs
*GPIOE_MODER = 0x00005555;
graphic_ctrl_bit_clear(B_RS);
graphic_ctrl_bit_set(B_RW);
delay_500ns();
while(1) {
graphic_ctrl_bit_set(B_E);
delay_500ns();
c = *GPIOE_IDR_HIGH & LCD_BUSY;
graphic_ctrl_bit_clear(B_E);
delay_500ns();
if( c == 0 ) break;
}
*GPIOE_MODER = 0x55555555; // 15-0 outputs
}
static uint8_t graphic_read(uint8_t controller) {
uint8_t c;
graphic_ctrl_bit_clear(B_E);
*GPIOE_MODER = 0x00005555; // 15-8 inputs, 7-0 outputs
graphic_ctrl_bit_set(B_RS|B_RW);
select_controller(controller);
delay_500ns();
graphic_ctrl_bit_set(B_E);
delay_500ns();
c = *GPIOE_IDR_HIGH;
graphic_ctrl_bit_clear(B_E);
*GPIOE_MODER = 0x55555555; // 15-0 outputs
if( controller & B_CS1 ) {
select_controller(B_CS1);
graphic_wait_ready();
}
if( controller & B_CS2 ) {
select_controller(B_CS2);
graphic_wait_ready();
}
return c;
}
static uint8_t graphic_read_data(uint8_t controller) {
graphic_read(controller);
return graphic_read(controller);
}
static void graphic_write(uint8_t value, uint8_t controller) {
*GPIOE_ODR_HIGH = value;
select_controller(controller);
delay_500ns();
graphic_ctrl_bit_set(B_E);
delay_500ns();
graphic_ctrl_bit_clear( B_E );
if(controller & B_CS1) {
select_controller( B_CS1);
graphic_wait_ready();
}
if(controller & B_CS2) {
select_controller( B_CS2);
graphic_wait_ready();
}
}
void graphic_write_command(uint8_t command, uint8_t controller) {
graphic_ctrl_bit_clear(B_E);
select_controller(controller);
graphic_ctrl_bit_clear(B_RS|B_RW);
graphic_write(command, controller);
}
void graphic_write_data(uint8_t data, uint8_t controller) {
graphic_ctrl_bit_clear(B_E);
select_controller(controller);
graphic_ctrl_bit_set(B_RS);
graphic_ctrl_bit_clear(B_RW);
graphic_write(data, controller);
}
void graphic_clear_screen(void) {
uint8_t i, j;
for(j = 0; j < 8; j++) {
graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
for(i = 0; i <= 63; i++){
graphic_write_data(0, B_CS1|B_CS2);
}
}
}
void pixel(int x, int y, int set) {
uint8_t mask, c, controller;
int index;
if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
index = (y-1)/8;
switch( (y-1)%8 ) {
case 0: mask = 1; break;
case 1: mask = 2; break;
case 2: mask = 4; break;
case 3: mask = 8; break;
case 4: mask = 0x10; break;
case 5: mask = 0x20; break;
case 6: mask = 0x40; break;
case 7: mask = 0x80; break;
}
if(set == 0)
mask = ~mask;
if(x > 64){
controller = B_CS2;
x = x - 65;
} else {
controller = B_CS1;
x = x-1;
}
graphic_write_command(LCD_SET_ADD | x, controller );
graphic_write_command(LCD_SET_PAGE | index, controller );
c = graphic_read_data(controller);
graphic_write_command(LCD_SET_ADD | x, controller);
if(set)
mask = mask | c;
else
mask = mask & c;
graphic_write_data(mask, controller);
}

