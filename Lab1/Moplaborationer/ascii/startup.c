
/*
 * 	startup.c
 *
 */
#define		STK_CTRL ((volatile unsigned int*) (0xE000E010))
#define		STK_LOAD ((volatile unsigned int*) (0xE000E014))
#define		STK_VAL ((volatile unsigned int*) (0xE000E018))

#define B_E         0x40
#define B_SELECT    4
#define B_RW        2
#define B_RS        1

#define PORT_DISPLAY_BASE       0x40021000  
/*Definiera word-adresser för initieringar*/
#define portModer   ((volatile unsigned int *) (PORT_DISPLAY_BASE))
#define portOtyper  ((volatile unsigned short *)(PORT_DISPLAY_BASE+0x4))
#define portOspeedr ((volatile unsigned int *) (PORT_DISPLAY_BASE+0x8))
#define portPupdr   ((volatile unsigned int *) (PORT_DISPLAY_BASE+ 0xC ))
/*Definiera byte-adresser för data och styrregister*/
#define portIdrLow  ((volatile unsigned char *) (PORT_DISPLAY_BASE + 0x10))
#define portIdrHigh ((volatile unsigned char *) (PORT_DISPLAY_BASE + 0x11))
#define portOdrLow  ((volatile unsigned char *) (PORT_DISPLAY_BASE + 0x14))
#define portOdrHigh ((volatile unsigned char *) (PORT_DISPLAY_BASE + 0x15))


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
#ifdef  SIMULATOR
    ms = ms/1000;
    ms++;
#endif
    while(ms > 0){
        {
            delay_mikro(1000);
            ms--;
            
        }
    }
}

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
    c = *portIdrHigh;
    ascii_ctrl_bit_clear(B_E);
    return c;
}

unsigned char ascii_read_status(void)
{
    unsigned char c;
    *portModer = 0x00005555;
    ascii_ctrl_bit_set(B_RW);
    ascii_ctrl_bit_clear(B_RS);
    c = ascii_read_controller();
    *portModer = 0x55555555;
    return c;
}
unsigned char ascii_read_data ( void ) 
{
	unsigned char c;
	*portModer = 0x00005555;
	ascii_ctrl_bit_set(B_RW);
	ascii_ctrl_bit_set(B_RS);
	c = ascii_read_controller();
	*portModer = 0x55555555; /*sätt portE bit15-bit8 som utgångar*/
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

void init_app( void )
{
    *portModer      = 0x00005555;
    *portOtyper     = 0x00000000;
    *portOspeedr    = 0x00005555;
    *portPupdr      = 0x55550000;
}


int main(int argc, char **argv)
{
    char *s;
    char test1[] = "Alfanumerisk";
    char test2[] = "Display - test";
    
    init_app();
    ascii_init();
    ascii_gotoxy(1,1);
    s = test1;
    while( *s )
        ascii_write_char( *s++ );
    ascii_gotoxy(1,2);
    s = test2;
    while (*s)
        ascii_write_char( *s++ );
    return 0;
}
