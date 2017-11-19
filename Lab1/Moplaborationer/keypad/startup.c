/*
 * 	startup.c
 *
 */
#define	GPIO_D			0x40020C00
#define	GPIO_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
#define	GPIO_OTYPER		((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 bytes vilket är 16 bitar.*/
#define GPIO_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO behöver*/
#define GPIO_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
#define GPIO_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste man ha offset 11*/
#define GPIO_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
#define GPIO_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste man ha offset 15*/

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

void app_init ( void )
{
	*GPIO_MODER = 0x55005555;
	/*sätter våra in och ut portar*/
	*GPIO_OTYPER = 0x70;
	*GPIO_PUPDR = 0x0AA;
	*GPIO_ODR_HIGH = *GPIO_ODR_HIGH & 0x00FF;
}

void activateRow ( unsigned int row )
{
	/*ativerar raden för den nedtryckta tangented och man borde deaktivera de andra*/
	switch ( row )
	{
	case 1: *GPIO_ODR_HIGH = 0x10; break;
	case 2: *GPIO_ODR_HIGH = 0x20; break;
	case 3: *GPIO_ODR_HIGH = 0x40; break;
	case 4: *GPIO_ODR_HIGH = 0x80; break;
	case 0: *GPIO_ODR_HIGH = 0x00; break;
	}
}

void out7seg( unsigned char c ) /*c skall tolkas som tangentkod*/
{
	unsigned char segCode[]={0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0xF7, 0xFF, 0xB9, 0xBF, 0xF9, 0xF1};
	if ( c == 0xFF)
	{
		*GPIO_ODR_LOW = 0x00; /*sätter värde 0 på 7segmentssaken, släcker alla dioder */
	} 
	else
	{
		*GPIO_ODR_LOW = segCode[c]; /*sätter vad knapptrycket är på 7segmentsdisplayen.*/
	}	
}



int getCol ( void )
{
	/*om någon tangent i aktiverad rad är nedtryckt så skall dess kolumn nummer returneras. Annars returneras 0*/
	unsigned char c;
	c = *GPIO_IDR_HIGH;
	if ( c & 0x8 ) return 4;
	if ( c & 0x4 ) return 3;
	if ( c & 0x2 ) return 2;
	if ( c & 0x1 ) return 1;
	return 0;
}
unsigned char keyb ( void ) 
{
	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
	int row, col;
	for (row=1; row<=4; row++){
		activateRow( row );
		if( ( col = getCol() ) ) /* om col blir tilldelat nol kommer inte ifsatsen att köras*/
		{
			activateRow( 0 ); /*sätter raden til 0 så att den lir nolstäld och att avläsning efter åt inte blir fel. Row och col har redan fått värden s¨å de ör chill*/
			return key[ 4*(row-1)+(col-1) ];
		}
	}
	activateRow ( 0 );
	return 0xFF;
}

void main(void)
{
	app_init();
	while(1){
		out7seg( keyb() );
	}
}

