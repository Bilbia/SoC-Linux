#include <stdio.h>
#include "system.h"
#include <alt_types.h>
#include <io.h> /* Leiutura e escrita no Avalon */

int main(void){
  unsigned int sw;
  unsigned int dir = 0;
  unsigned int vel;
  unsigned int phase = 0;
  unsigned int stage = 0;


  printf("VroomVroom \n");

  while(1){
	  sw = IORD_32DIRECT(PIO_2_BASE, 0);
	  dir = (sw >> 1) & 1;
	  vel = ((sw >> 2) & 1) + ((sw >> 3) & 1) + ((sw >> 4) & 1)  + ((sw >> 5) & 1);


	  if (sw & 1){
		  if (dir & 1){
			  phase = 0x08 >> stage;
		  } else {
			  phase = 0x01 << stage;
		  }

		  IOWR_32DIRECT(PIO_1_BASE, 0, phase);
		  IOWR_32DIRECT(PIO_0_BASE, 0, phase);

		  if(stage == 3){
			  stage = 0;
		  } else {
			  stage ++;
		  }
	  }
	  usleep(100000 / (vel *20));
  };

  return 0;
}
