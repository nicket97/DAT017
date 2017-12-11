typedef struct tRacket{
    PGEOMETRY geo;
    int dirx, diry;
    int posx, posy;
    void (* draw) (struct tRacket *);
    void (* clear) (struct tRacket *);
    void (* move) (struct tRacket *);
    void (* set_speed) (struct tRacket *, int);
	int (* pos_x_inbounds) (struct tRacket *, int);
	int (* pos_y_inbounds) (struct tRacket *, int);
} RACKET, *PRACKET;

void pixel( int x, int y, int set );

void set_racket_speed(PRACKET o, int speedy) {
    o->diry = speedy;
}

void draw_racket(PRACKET o) {
    for (int i = 0; i < o->geo->numpoints; i++) {
        pixel((o->geo->px[i].x) + o->posx, (o->geo->px[i].y) + o->posy, 1);
    }
}

void clear_racket(PRACKET o) {
    for (int i = 0; i < o->geo->numpoints; i++) {
        pixel((o->geo->px[i].x) + o->posx, (o->geo->px[i].y) + o->posy, 0);
    }
}

void move_racket(PRACKET o) 
{
    clear_racket(o);
    o->posx += o->dirx;
    o->posy += o->diry;
    
    if (o->posx < 1) {
        o->dirx = o->dirx * -1;
        o->posx += o->dirx;
    }
    
    else if (o->posx + o->geo->sizex > 128) {
        o->dirx = o->dirx * -1;
        o->posx += o->dirx;
    }
    
    if (o->posy < 1) {
        o->diry = o->diry * -1;
        o->posy += o->diry;
    }
    
    else if (o->posy + o->geo->sizey > 64) {
        o->diry = o->diry * -1;
        o->posy += o->diry;
    }
    draw_racket(o);
}

int pos_x_racket_inbounds(PRACKET o, int positionx){
	int tmp = o->posx - positionx;
	if ((tmp > o->geo->sizex) || (tmp < 0)) return 0;
	else return 1;
}

int pos_y_racket_inbounds(PRACKET o, int positiony){
	int tmp = o->posy - positiony;
	if ((tmp > o->geo->sizey) || (tmp < 0)) return 0;
	else return 1;
}