/*
 * 	startup.c
 *
 */
#include "geometry.h"
//#include "object.h"
//#include "racket.h"
#include "pongball.h"

#define     B_E                 0x40    /* Enable */ 
#define     B_RST               0x20    /* Reset  */ 
#define     B_CS2               0x10    /* Controller Select 2 */ 
#define     B_CS1               8          /* Controller Select 1 */ 
#define     B_SELECT            4          /* ASCII or Graphics select */ 
#define     B_RW                2          /* Read/Write */ 
#define     B_DI                1          /* Data or Instruction : 1 data, 0 Instr */
#define     LCD_ON              0x3F       /* Display på */       
#define     LCD_OFF             0x3E       /* Av */ 
#define     LCD_SET_ADD         0x40       /* Set X adress  (0 –63) */ 
#define     LCD_SET_PAGE        0xB8      /* Set Y adress (0 –7) */ 
#define     LCD_DISP_START      0xC0      /* Start adress i display minne */ 
#define     LCD_BUSY            0x80      /* läsa ut busystatus. R/W skall vara hög */
 
#define     PORT_DISPLAY_BASE   0x40021000/* MD407 port E */ 
#define     portModer           ((volatile unsigned int*)(PORT_DISPLAY_BASE))  
#define     portOtyper          ((volatile unsigned short *) (PORT_DISPLAY_BASE+0x4))  
#define     portOspeedr         ((volatile unsigned int*)(PORT_DISPLAY_BASE+0x8))  
#define     portPupdr           ((volatile unsigned int*)(PORT_DISPLAY_BASE+0xC))  
#define     portIdr             ((volatile unsigned short *) (PORT_DISPLAY_BASE+0x10))  
#define     portIdrHigh         ((volatile unsigned char *)  (PORT_DISPLAY_BASE+0x11))  
#define     portOdrLow          ((volatile unsigned char *)(PORT_DISPLAY_BASE+0x14))  
#define     portOdrHigh         ((volatile unsigned char *)(PORT_DISPLAY_BASE+0x14+1)) 

#define		STK_CTRL            ((volatile unsigned int*) (0xE000E010))
#define		STK_LOAD            ((volatile unsigned int*) (0xE000E014))
#define		STK_VAL             ((volatile unsigned int*) (0xE000E018))

//for keypad
#define GPIO_D_MODER    0x40020C00
#define GPIO_D_OTYPER   0x40020C04
#define GPIO_D_PUPDR    0x40020C0C
#define GPIO_D_INPUT    0x40020C10
#define GPIO_D_OUTPUT   0x40020C14

//#define SIMULATOR
char p1_score = 0;
char p2_score = 0;
char offset = 48;

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
void init_app(void) 
{
	*( (unsigned long *) 0x40023830) = 0x18;
	
    /* PORT E */ 
    *portModer =     0x55555555;  /* all bits outputs */ 
    *portOtyper =    0x00000000;/* outputs arepush/pull*/ 
    *portOspeedr =   0x55555555;/* medium speed */ 
    *portPupdr =     0x55550000;/* inputs arepullup*/
	
    // port 15-8 -> Keypad
    *( (unsigned long *) GPIO_D_MODER) = 0x55000000;
	
    //OTYPER bits 15-8 to push-pull
    *( (unsigned short *) GPIO_D_OTYPER) = 0x0000; //00000000
	
    //PUPDR bits 23-16 to pull-down, rest to zero
    *( (unsigned long *) GPIO_D_PUPDR) = 0x00AA0000; //10101010 000000000 000000000
}

void delay250ns(void)
{
    *STK_CTRL   = 0;
    *STK_LOAD   = (168/4)-1;   // minst 500 ns
    *STK_VAL    = 0;
    *STK_CTRL   = 5;
    while((* STK_CTRL & 0x10000) == 0) ;
    *STK_CTRL   = 0;
}

void delay_500ns(void)
{
    delay250ns();
    delay250ns();
}

void delay_mikro(unsigned int us)
{
//#ifdef   SIMULATOR
    //us = us / 1000;
    //us++;
//#endif
    while(us < 0){
        {
            delay250ns();
            delay250ns();
            delay250ns();
            delay250ns();
            us--;
        }
    }
}

void delay_milli(unsigned ms)
{
//#ifdef  SIMULATOR
    //ms = ms/1000;
    //ms++;
//#endif
    while(ms > 0){
        {
            delay_mikro(1);
            delay_mikro(1000);
            ms--;
            
        }
    }
}


static void graphic_ctrl_bit_set( unsigned char x ) 
{ 
    *portOdrLow |= ( ~B_SELECT & x );
 } 
static void graphic_ctrl_bit_clear( unsigned char x ) 
{ 
    *portOdrLow &= ( ~B_SELECT & ~x ); 
}

static void select_controller(unsigned char controller) 
{ 
    switch(controller){
        case 0: graphic_ctrl_bit_clear(B_CS1|B_CS2);  break; 
        case B_CS1 : graphic_ctrl_bit_set(B_CS1); graphic_ctrl_bit_clear(B_CS2); break; 
        case B_CS2 : graphic_ctrl_bit_set(B_CS2); graphic_ctrl_bit_clear(B_CS1);  break; 
        case B_CS1|B_CS2 : graphic_ctrl_bit_set(B_CS1|B_CS2);  break; 
    }
} 

static void graphic_wait_ready(void) 
{ 
    unsigned char c;
    
    graphic_ctrl_bit_clear( B_E ); 
    *portModer= 0x00005555; /* b15-8 are inputs, b7-0 are outputs */ 
    graphic_ctrl_bit_clear( B_DI ); 
    graphic_ctrl_bit_set( B_RW ); 
    delay_500ns();
    
    while( 1 ) 
    { 
        graphic_ctrl_bit_set( B_E ); 
        delay_500ns(); 
        c = *portIdrHigh & 0x80; 
        if( c == 0 )break; 
        graphic_ctrl_bit_clear( B_E ); 
        delay_500ns(); 
    } 
    *portModer= 0x55555555; /* all bits outputs */ 
    graphic_ctrl_bit_set( B_E );
}

static unsigned char  display_read(unsigned char controller) 
{ 
    unsigned char c; 
    *portModer= 0x00005555; /* b15-8 are inputs, 7-0 are outputs */ 
    select_controller( controller );

    graphic_ctrl_bit_clear( B_E ); 
    graphic_ctrl_bit_set( B_DI | B_RW ); 
    delay_500ns(); 
    graphic_ctrl_bit_set( B_E ); 
    delay_500ns(); 
    c = *portIdrHigh;
    graphic_ctrl_bit_clear( B_E ); 
    *portModer= 0x55555555; /* all bits outputs */
    
    if( controller & B_CS1 ) 
    { 
        select_controller( B_CS1); 
        graphic_wait_ready(); 
    } 
    if( controller & B_CS2 ) 
    { 
        select_controller( B_CS2); 
        graphic_wait_ready(); 
    } 
    return c; 
}

static void graphic_write(unsigned char val, unsigned char controller) 
{ 
    *portOdrHigh= val; 
    select_controller( controller ); 
    delay_500ns(); 
    graphic_ctrl_bit_set( B_E ); 
    delay_500ns(); 
    graphic_ctrl_bit_clear( B_E ); 
    if( controller & B_CS1 ) 
        { 
            select_controller( B_CS1); 
            graphic_wait_ready(); 
        } 
    if( controller & B_CS2 ) 
        { 
            select_controller( B_CS2); 
            graphic_wait_ready(); 
        }

    *portOdrHigh = 0; 
    graphic_ctrl_bit_set( B_E ); 
    select_controller( 0 );
}

static void graphic_writeCommand(unsigned char commandToWrite, unsigned char controller) 
{ 
    graphic_ctrl_bit_clear( B_E ); 
    graphic_ctrl_bit_clear( B_DI | B_RW ); 
    graphic_write(commandToWrite, controller); 
}
static void graphic_writeData(unsigned char data, unsigned char controller) 
{ 
    graphic_ctrl_bit_clear( B_E ); 
    graphic_ctrl_bit_set( B_DI ); 
    graphic_ctrl_bit_clear( B_RW ); 
    graphic_write(data, controller); 
}

void graphic_initalize(void) 
{ 
    graphic_ctrl_bit_set( B_E ); 
    delay_mikro(10);
    graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);  
    delay_milli( 30 ); 
    graphic_ctrl_bit_set(B_RST); 
    graphic_writeCommand(LCD_OFF, B_CS1|B_CS2); 
    graphic_writeCommand(LCD_ON, B_CS1|B_CS2); 
    graphic_writeCommand(LCD_DISP_START, B_CS1|B_CS2); 
    graphic_writeCommand(LCD_SET_ADD, B_CS1|B_CS2); 
    graphic_writeCommand(LCD_SET_PAGE, B_CS1|B_CS2); 
    select_controller(0);
}

void graphic_clearScreen(void) 
{ 
    unsigned char i, j; 
    for(j = 0; j < 8; j++) 
    { 
        graphic_writeCommand(LCD_SET_PAGE | j, B_CS1|B_CS2 ); 
        graphic_writeCommand(LCD_SET_ADD | 0, B_CS1|B_CS2 ); 
        for(i = 0; i <= 63; i++)
        {
            graphic_writeData(0,  B_CS1|B_CS2); 
        } 
    } 
}

static unsigned char graphic_read(unsigned char controller)
{ 
    display_read(controller);
    return display_read(controller);
}

void pixel( int x, int y, int set ) 
{ 
    unsigned char mask,c, controller; 
    int index;

    if( (x > 128 ) || (y > 64) ) 
        return;

	index = (y-1)/8;
	switch((y-1)%8) {
		case 0: mask = 0x01; break;
		case 1: mask = 0x02; break;
		case 2: mask = 0x04; break;
		case 3: mask = 0x08; break;
		case 4: mask = 0x10; break;
		case 5: mask = 0x20; break;
		case 6: mask = 0x40; break;
		case 7: mask = 0x80; break;
	}
	
	if(set==0){
		mask = ~mask;
	}
    
	if(x > 64){ 
        controller = B_CS2; 
        x = x -65; 
    } else{
        controller = B_CS1; x = x-1; 
    }
    graphic_writeCommand(LCD_SET_ADD | x, controller ); 
    graphic_writeCommand(LCD_SET_PAGE | index, controller ); 
    c = graphic_read( controller ); 
    graphic_writeCommand(LCD_SET_ADD | x, controller ); 
    if( set ) mask = mask | c; 
    else mask = mask & c; 
    graphic_writeData( mask, controller); 
	
    graphic_writeCommand(LCD_ON, B_CS1|B_CS2);
}

/*ASCII SHIT*/
void ascii_ctrl_bit_set( unsigned char x )
{
    unsigned char c;
    c = *portOdrLow;
    c |=  (B_SELECT | x);
    *portOdrLow = c;
}

void ascii_ctrl_bit_clear(unsigned char x)
{
    unsigned char  c;
    c = *portOdrLow;
    c &= (B_SELECT | ~x);
    *portOdrLow = c;
}

void ascii_write_controller( unsigned char c)
{
    ascii_ctrl_bit_set(B_E);      // E = 1
    *portOdrHigh = c;
    ascii_ctrl_bit_clear(B_E);    // E = 0
    delay250ns();
}

void ascii_write_cmd(unsigned char c)
{
    ascii_ctrl_bit_clear(B_DI | B_RW);    // "|" = bitvis eller
    ascii_write_controller(c);
}


void ascii_write_data(unsigned char c)
{
    ascii_ctrl_bit_clear(B_RW);
    ascii_ctrl_bit_set(B_DI);
    ascii_write_controller(c);
}

unsigned char ascii_read_controller(void)
{
    unsigned char c;
    ascii_ctrl_bit_set(B_E);
    delay250ns();
    delay250ns();
    c = *portIdrHigh;
    ascii_ctrl_bit_clear(B_E);
    return c;
}

unsigned char ascii_read_status(void)
{
    unsigned char c;
    *portModer = 0x00005555;
    ascii_ctrl_bit_set(B_RW);
    ascii_ctrl_bit_clear(B_DI);
    c = ascii_read_controller();
    *portModer = 0x55555555;
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

/*Eventuella hjälprutiner*/
void activateRow ( unsigned int adress, unsigned int row )
{
	unsigned char bitmask = (0x10 << row);
	*( (unsigned char *) adress) = bitmask;
}

int checkValues(unsigned int adress)
{
	 unsigned char colsValue = *((unsigned char *) adress);
	 colsValue &= 0x0F;
	 switch(colsValue) {
		 case 1: return 1;
		 case 2: return 2;
		 case 4: return 3;
		 case 8: return 4;
		 default: return 0;
	 }
}

unsigned char keyb ( unsigned int inadress, unsigned int outadress )
{
	unsigned char keys[] = {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0,0,0,0xD};
    for (int row = 0; row <= 3; row++)
    {
        activateRow(outadress, row);
        int col = checkValues(inadress);
        if(col != 0)
        {
            return keys[(col + (row * 4) - 1)];
        }
    }
    return 0xFF;
}

void checkForGoals(PPONGBALL o){
	if ((o->pos_x_inbounds(o, 0) == 1)){
		p2_score++;
		resetBallPosition(o);
		writeScore();
	} else if ((o->pos_x_inbounds(o, 128) == 1)){
		p1_score++;
		resetBallPosition(o);
		writeScore();
	}
}

void resetBallPosition(PPONGBALL o){
	o->clear(o);
	o->posx = 64;
	o->posy = 32;
	o->draw(o);
}

void writeScore(){
	//char *s;
    //char test1[] = "0 - 0";
	ascii_gotoxy(9,1);
	ascii_write_char( p1_score + offset );
	ascii_write_char( 32 );
	ascii_write_char( 45 );
	ascii_write_char( 32 );
	ascii_write_char( p2_score + offset );
    /*s = test1;
    while( *s )
        ascii_write_char( *s++ );*/
}

GEOMETRY ball_geometry = 
{
    12,     /* numpoints*/
    4, 4,   /* sizex, sizey*/
    {
        /* px[0,1,2,3...]*/
        {0,1}, {0,2}, {1,0}, {1,1}, {1,2},
        {1,3}, {2,0}, {2,1}, {2,2}, {2,3},
        {3,1}, {3,2}
    }
};

GEOMETRY rect_geometry = {
	26,
	2, 13,
	{
		{0,0},{1,0},
		{0,1},{1,1},
		{0,2},{1,2},
		{0,3},{1,3},
		{0,4},{1,4},
		{0,5},{1,5},
		{0,6},{1,6},
		{0,7},{1,7},
		{0,8},{1,8},
		{0,9},{1,9},
		{0,10},{1,10},
		{0,11},{1,11},
		{0,12},{1,12},
	}
};
    
static PONGBALL ball = 
{
    &ball_geometry, /* geometri för en boll */ 
    1, 1,           /* initiala riktningskoordinater */
    64, 32,           /* initial startposition */
    draw_object,
    clear_object,
    move_object,
    set_object_speed_x,
	set_object_speed_y,
	pos_x_pongball_inbounds,
	pos_y_pongball_inbounds
};

static RACKET racket_1 = {
	&rect_geometry,
	0, 1,
	4, 2,
	draw_racket,
	clear_racket,
	move_racket,
	set_racket_speed,
	pos_x_racket_inbounds,
	pos_y_racket_inbounds
};

static RACKET racket_2 = {
	&rect_geometry,
	0, 1,
	124, 2,
	draw_racket,
	clear_racket,
	move_racket,
	set_racket_speed,
	pos_x_racket_inbounds,
	pos_y_racket_inbounds
};

int main(void)
{
	char c;
	
	init_app();
    ascii_init();
	writeScore();
	
    PPONGBALL p = &ball;
	PRACKET r1 = &racket_1;
	PRACKET r2 = &racket_2;
	
    graphic_initalize(); 
    //#ifndef SIMULATOR
        graphic_clearScreen();
    //#endif

    while( 1 ) 
    {
		checkForGoals(p);
        p->move(p, r1, r2);
		r1->move(r1);
		r2->move(r2);
        //delay_milli(100000);/* 25 frames/sec */
		c = keyb((GPIO_D_INPUT+1), (GPIO_D_OUTPUT+1));
		switch (c){
			case 1: r1->set_speed(r1, -2); break;
			case 7: r1->set_speed(r1, 2); break;
			case 5: r2->set_speed(r2, -2); break;
			case 0: r2->set_speed(r2, 2); break;
		}
    }
    return 0;
}

