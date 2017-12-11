/*
 * 	startup.c
 *
 */
 typedef unsigned char uint8_t;
 
 #include "graphicsDriver.h"
 
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
#define MAX_POINTS 20

typedef struct tPoint{
    unsigned char x;
    unsigned char y;
}POINT;

typedef struct tGeometry{
     int numpoints;
     int sizex;
     int sizey;
     POINT px[MAX_POINTS];
    }GEOMETRY, *PGEOMETRY;
    
typedef struct tObj{
    PGEOMETRY geo;
    int dirx,diry;
    int posx,posy;
    void (* draw)(struct tObj *);
    void (* clear)(struct tObj *);
    void (* move)(struct tObj *);
    void (* set_speed)(struct tObj * , int, int);
    }OBJECT, *POBJECT;
    
GEOMETRY ball_geometry = {
    12,
    4,4,
    {
        {0,1}, {0,2}, {1,0},{1,1},{1,2},
        {1,3},{2,0},{2,1},{2,2},{2,3},
        {3,1},
        {3,2}
    }
    };
    GEOMETRY paddle_geometry = {
    0,
    2,10,
    {
        {0,0}
    }
    };
    
void set_object_speed(POBJECT p, int x, int y){
    p->dirx = x;
    p->diry = y;
    }
    
void draw_object(POBJECT p){
     POINT *ptr = p->geo->px;
    for(int i = 0; i < p->geo->numpoints; i++){
        
        //unsigned int x = p->posx + (p->geo->px->x + i);
        //unsigned int y = p->posy + (p->geo->px->y+ i);
       
        unsigned int x = p->posx + ptr->x;
        unsigned int y = p->posy + ptr->y;
        
        pixel(x,y, 1);
        ptr++;
        }
    }
void clear_object(POBJECT p){
     POINT *ptr = p->geo->px;
    for(int i = 0; i < p->geo->numpoints; i++){
        unsigned int x = p->posx + ptr->x;
        unsigned int y = p->posy + ptr->y;
        
        pixel(x,y, 0);
        ptr++;
        
        
        }
    }
void move_object(POBJECT p){
    clear_object(p);
    
    p->posx = p->posx + p->dirx;
    p->posy = p->posy + p->diry;
    int px = p->posx;
    int py = p->posy;
    
    draw_object(p);
    }
    void move_paddle_object(POBJECT p){
    clear_rect_object(p);
    
    p->posx = p->posx + p->dirx;
    p->posy = p->posy + p->diry;
    int px = p->posx;
    int py = p->posy;
    
    draw_rect_object(p);
    }
void draw_rect_object(POBJECT pa){
    for(int ii = 0; ii < pa->geo->sizex; ii++){
        for(int jj = 0 ;  jj < pa->geo->sizey; jj++){
            pixel(pa->posx + ii, pa->posy + jj, 1);
            }
        }
    }
    void clear_rect_object(POBJECT pa){
    for(int ii = 0; ii < pa->geo->sizex; ii++){
        for(int jj = 0 ;  jj < pa->geo->sizey; jj++){
            pixel(pa->posx + ii, pa->posy + jj, 0);
            }
        }
    }
    static OBJECT ball = {
    &ball_geometry,
    0,0,
    80,10,
    draw_rect_object,
    clear_object,
    move_object,
    set_object_speed
    };
    static OBJECT paddle1 = {
        &paddle_geometry,
        0,0,
        3,30,
        draw_rect_object,
        clear_rect_object,
        move_paddle_object,
        set_object_speed
        };
         static OBJECT paddle2 = {
        &paddle_geometry,
        0,0,
        125,30,
        draw_rect_object,
        clear_rect_object,
        move_paddle_object,
        set_object_speed
        };
    int point1 = 0;
    int point2 = 0;
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
	/*sätter våra in och ut portar*/
	*GPIOE_OTYPER = 0x00000000;
	*GPIOE_PUPDR = 0x55550000;
    *GPIOE_OSPEDER = 0x00005555;
	//*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
    
    *GPIOD_MODER = 0x55005555;
	/*sätter våra in och ut portar*/
	*GPIOD_OTYPER = 0x70;
	*GPIOD_PUPDR = 0x0AA;
	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
    
    }
    int getCol ( void )
{
	/*om nÃ¥gon tangent i aktiverad rad Ã¤r nedtryckt sÃ¥ skall dess kolumn nummer returneras. Annars returneras 0*/
	unsigned char c;
	c = *GPIOD_IDR_HIGH;
	if ( c & 0x8 ) return 4;
	if ( c & 0x4 ) return 3;
	if ( c & 0x2 ) return 2;
	if ( c & 0x1 ) return 1;
	return 0;
}

void activateRow ( unsigned int row )
{
	/*ativerar raden fÃ¶r den nedtryckta tangented och man borde deaktivera de andra*/
	switch ( row )
	{
	case 1: *GPIOD_ODR_HIGH = 0x10; break;
	case 2: *GPIOD_ODR_HIGH = 0x20; break;
	case 3: *GPIOD_ODR_HIGH = 0x40; break;
	case 4: *GPIOD_ODR_HIGH = 0x80; break;
	case 0: *GPIOD_ODR_HIGH = 0x00; break;
	}
}

    unsigned char keyb ( void ) 
{
	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
	int row, col;
	for (row=1; row<=4; row++){
		activateRow( row );
		if( ( col = getCol() ) ) /* om col blir tilldelat nol kommer inte ifsatsen att kÃ¶ras*/
		{
			activateRow( 0 ); /*sÃ¤tter raden til 0 sÃ¥ att den lir nolstÃ¤ld och att avlÃ¤sning efter Ã¥t inte blir fel. Row och col har redan fÃ¥tt vÃ¤rden sÂ¨Ã¥ de Ã¶r chill*/
			return key[ 4*(row-1)+(col-1) ];
		}
	}
	activateRow ( 0 );
	return 0xFF;
}
void main(void)
{   
    init_app();

    char c;
    POBJECT p = &ball;
    POBJECT pa1 = &paddle1;
    POBJECT pa2 = &paddle2;
    graphic_initialize();
    ascii_init();
   updatePoints();
   graphic_clear_screen();// simulator onely
    pa1->draw(pa1);
    pa2->draw(pa2);
    p->set_speed(p,5,0);
 while(1){
     checkForGoals(p);
    
    p->move(p);
    pa1->move(pa1);
    pa2->move(pa2);
     delay_milli(40);
     c = keyb();
     switch(c)
     {
         case 1: pa1->set_speed(pa1,0,-2);
         break;
         case 7: pa1->set_speed(pa1,0,2);
         break;
         //case 3: pa2->set_speed(pa2,0,-2);
         //case 9: pa2->set_speed(pa2,0,2);
         }
         if(pa2->posy < p->posy){
             pa2->set_speed(pa2, 0, 2);
             }
             if(pa2->posy > p->posy){
             pa2->set_speed(pa2, 0, -2);
             }
         if(p->posy < 1){
             p->set_speed(p,p->dirx,2);
             }
            if(p->posy > 60){
             p->set_speed(p,p->dirx,-2);
             }
             int yy = p->posy;
             int yy2 = pa2->posy;
             if(p->posx < 6 ){
                 if((p->posy+2) > pa1->posy ){
                     if( (p->posy +2)<( pa1->posy +10)){
                        p->set_speed(p, 2, p->diry);
                     }
                 }
            }
            if(p->posx > 119){
                 if((p->posy+2) > pa2->posy ){
                     if( (p->posy +2)<( pa2->posy +10)){
                        p->set_speed(p, -2, p->diry);
                     }
                 }
            }
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
us = us / 1000;
    us++;
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
void drawRect(int x, int y){}


void checkForGoals(POBJECT p){
    if(p->posx < 1){
        point2++;
        p->set_speed(p,2,3);
        resetBall();
        updatePoints();
        }
        if(p->posx > 120){
            p->set_speed(p,-2,3);
            resetBall();
            point1 ++;
            updatePoints();
            }
            if(point1 == 5){
                 ascii_gotoxy(1,2);
                ascii_write_char('P');
                ascii_write_char('L');
                ascii_write_char('A');
                ascii_write_char('Y');
                ascii_write_char('E');
                ascii_write_char('R');
                ascii_write_char(' ');
                ascii_write_char('1');
                ascii_write_char(' ');
                ascii_write_char('W');
                ascii_write_char('O');
                ascii_write_char('N');
                ascii_write_char('!');
                p->set_speed(p,0,0);
                waitForNewGame();
                }
                if(point2 == 5){
                    
                      ascii_gotoxy(1,2);
                ascii_write_char('P');
                ascii_write_char('L');
                ascii_write_char('A');
                ascii_write_char('Y');
                ascii_write_char('E');
                ascii_write_char('R');
                ascii_write_char(' ');
                ascii_write_char('2');
                ascii_write_char(' ');
                ascii_write_char('W');
                ascii_write_char('O');
                ascii_write_char('N');
                ascii_write_char('!');
                p->set_speed(p,0,0);
                waitForNewGame();
                }
    }
    void updatePoints(void){
         ascii_gotoxy(8,1);
        ascii_write_char(point1 + '0');
        ascii_write_char(' ');
        ascii_write_char('-');
        ascii_write_char(' ');
        ascii_write_char(point2 + '0');
        }
void resetBall(POBJECT p){
    clear_object(p);
    p->posx = 60;
    p->posy = 30;
}
void waitForNewGame(void){
    char c;
    while(1){
    c = keyb();
    if(c == '0'){
        main();
        }
    }
    }
