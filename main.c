

#include <stdlib.h>
#include <stdio.h>



#include "creations.c"
#include "functions.c"

RAM r;


int main( int argc , char* argv[] , char** env ) {
	FILE* f = fopen(argv[1],"rb");	
	fseek(f,0,SEEK_END);
	long _s = ftell(f);
	fseek(f,0,SEEK_SET);
	if (_s > 0x100) return 2;
	fread(r.ins,1,_s,f);
	r.ip = 0;
	while(1) {
		F[r.ins[r.ip]](&r);	
		r.ip++;
	}	
	fclose(f);
	return EXIT_SUCCESS;
}
