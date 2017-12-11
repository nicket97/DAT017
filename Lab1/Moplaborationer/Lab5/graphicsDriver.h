
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
void graphic_write(uint8_t value, uint8_t controller) {
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
void graphic_ctrl_bit_set(uint8_t x) {
uint8_t c;
c = *GPIOE_ODR_LOW;
c &= ~B_SELECT;
c |= (~B_SELECT & x);
*GPIOE_ODR_LOW = c;
}
void graphic_ctrl_bit_clear(uint8_t x) {
uint8_t c;
c = *GPIOE_ODR_LOW;
c &= ~B_SELECT;
c &= ~x;
*GPIOE_ODR_LOW = c;
}
void select_controller(uint8_t controller){
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
void ascii_ctrl_bit_set( unsigned char x )
{
    unsigned char c;
    c = *GPIOE_ODR_LOW;
    c |=  (B_SELECT | x);
    *GPIOE_ODR_LOW = c;
}

void ascii_ctrl_bit_clear(unsigned char x)
{
    unsigned char  c;
    c = *GPIOE_ODR_LOW;
    c &= (B_SELECT | ~x);
   *GPIOE_ODR_LOW = c;
}

void ascii_write_controller( unsigned char c)
{
    ascii_ctrl_bit_set(B_E);      // E = 1
    *GPIOE_ODR_HIGH = c;
    ascii_ctrl_bit_clear(B_E);    // E = 0
    delay_250ns();
}

void ascii_write_cmd(unsigned char c)
{
    ascii_ctrl_bit_clear(B_RS | B_RW);    // "|" = bitvis eller
    ascii_write_controller(c);
}


void ascii_write_data(unsigned char c)
{
    ascii_ctrl_bit_clear(B_RW);
    ascii_ctrl_bit_set(B_RS);
    ascii_write_controller(c);
}

unsigned char ascii_read_controller(void)
{
    unsigned char c;
    ascii_ctrl_bit_set(B_E);
    delay_250ns();
    delay_250ns();
    c = *GPIOE_IDR_HIGH;
    ascii_ctrl_bit_clear(B_E);
    return c;
}

unsigned char ascii_read_status(void)
{
    unsigned char c;
    *GPIOE_MODER = 0x00005555;
    ascii_ctrl_bit_set(B_RW);
    ascii_ctrl_bit_clear(B_RS);
    c = ascii_read_controller();
    *GPIOE_MODER = 0x55555555;
    return c;
}
unsigned char ascii_read_data ( void ) 
{
	unsigned char c;
	 *GPIOE_MODER = 0x00005555;
	ascii_ctrl_bit_set(B_RW);
	ascii_ctrl_bit_set(B_RS);
	c = ascii_read_controller();
	 *GPIOE_MODER = 0x55555555; /*sätt portE bit15-bit8 som utgångar*/
	return c;
}

void ascii_wait_ready( void )
{
    while( ( ascii_read_status() & 0x80) == 0x80) ;
    delay_mikro(8);
}

void ascii_write_char(unsigned char c)
{
    ascii_wait_ready();
    ascii_write_data(c);
    delay_mikro(39);
    
}

void ascii_init(void)
{
    ascii_wait_ready();
    ascii_write_cmd( 0x0C);    /*display on*/
    delay_mikro(39);
    ascii_wait_ready();
    ascii_write_cmd( 0x38);    /*function set*/
    delay_mikro(39);
    ascii_wait_ready();
    ascii_write_cmd( 1 );    /*clear display*/
    delay_milli(2);
    ascii_wait_ready();
    ascii_write_cmd( 6 );    /*entry mode set*/
    delay_mikro(39);
}

void ascii_gotoxy( unsigned char x, unsigned char y)
{
    ascii_wait_ready();
    unsigned char address;
    if(y != 1){
        address = 0x40 | (x-1);
    }
    else{
        address = x-1;
    }
    
    ascii_write_cmd ( 0x80 | address);
}
