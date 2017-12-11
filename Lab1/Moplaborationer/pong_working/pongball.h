#include "racket.h"

typedef struct tPongBall{
    PGEOMETRY geo;
    int dirx, diry;
    int posx, posy;
    void (* draw) (struct tPongBall *);
    void (* clear) (struct tPongBall *);
    void (* move) (struct tPongBall *, struct tRacket *, struct tRacket *);
    void (* set_speed_x) (struct tPongBall *, int);
    void (* set_speed_y) (struct tPongBall *, int);
	int (* pos_x_inbounds) (struct tPongBall *, int);
	int (* pos_y_inbounds) (struct tPongBall *, int);
} PONGBALL, *PPONGBALL;

void pixel( int x, int y, int set );

void set_object_speed_x(PPONGBALL o, int speedx){
	o->dirx = speedx;
}

void set_object_speed_y(PPONGBALL o, int speedy){
	o->diry = speedy;
}

void draw_object(PPONGBALL o) {
    for (int i = 0; i < o->geo->numpoints; i++) {
        pixel((o->geo->px[i].x) + o->posx, (o->geo->px[i].y) + o->posy, 1);
    }
}

void clear_object(PPONGBALL o) {
    for (int i = 0; i < o->geo->numpoints; i++) {
        pixel((o->geo->px[i].x) + o->posx, (o->geo->px[i].y) + o->posy, 0);
    }
}

void move_object(PPONGBALL o, PRACKET leftR, PRACKET rightR) 
{
    clear_object(o);
	
	
	if ((collide(leftR, o) == 1) || (collide(rightR, o) == 1)){
		o->dirx = o->dirx * -1;
	}
	
	//collide with rackets
	/*
	unsigned int new_x = o->posx + o->dirx;
	
	unsigned int new_y = o->posy + o->diry;
	 * if (leftR->pos_x_inbounds(leftR, new_x) == 1){
		if ((leftR->pos_y_inbounds(leftR, new_y) == 1) || (leftR->pos_y_inbounds(leftR, new_y + o->geo->sizey) == 1)){
			o->dirx = o->dirx * -1;
		}
	}
	
	if (rightR->pos_x_inbounds(rightR, new_x - o->geo->sizex) == 1){
		if ((rightR->pos_y_inbounds(rightR, new_y) == 1) || (rightR->pos_y_inbounds(rightR, new_y + o->geo->sizey) == 1)){
			o->dirx = o->dirx * -1;
		}
	}*/
	
	o->posx += o->dirx;
    o->posy += o->diry;
    
    if (o->posy < 1) {
        o->diry = o->diry * -1;
    } else if (o->posy + o->geo->sizey > 64) {
        o->diry = o->diry * -1;
    }
	
    draw_object(o);
}

int pos_x_pongball_inbounds(PPONGBALL o, int positionx){
	int tmp = o->posx - positionx;
	if ((tmp > o->geo->sizex) || (tmp < 0)) return 0;
	else return 1;
}

int pos_y_pongball_inbounds(PPONGBALL o, int positiony){
	int tmp = o->posy - positiony;
	if ((tmp > o->geo->sizey) || (tmp < 0)) return 0;
	else return 1;
}


int collide(PRACKET o, PPONGBALL p){
	for (int i = 0; i < o->geo->numpoints; i++){
		for (int j = 0; j < p->geo->numpoints; j++){
			int o_x = o->geo->px[i].x + o->posx;
			int o_y = o->geo->px[i].y + o->posy;
			
			int p_x = p->geo->px[j].x + p->posx;
			int p_y = p->geo->px[j].y + p->posy;
			
			if ((o_x == p_x) && (o_y == p_y)) return 1;
		}
	}
	
	return 0;
}