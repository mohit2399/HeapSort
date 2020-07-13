
#define FUNC_EXIT   0
#define FUNC_SET    1
#define FUNC_PRINT  2
#define FUNC_JMP    3
#define FUNC_MOV    4
#define FUNC_DEC    5
#define FUNC_INC    6
#define FUNC_SWAP   7
#define FUNC_HEAP   8


#define P(...) fprintf(stdout,__VA_ARGS__);fprintf(stdout,"\n")
#define S(...) fscanf(stdin,__VA_ARGS__);
#define L(...) fprintf(stderr,"[LOG] ");fprintf(stderr,__VA_ARGS__);fprintf(stderr,"\n")

typedef unsigned char u8 ;

struct RAM  {
	u8 storage[0x100];
	u8 ins[0x200];
	int ip;
	u8 regs[12];
};

typedef struct RAM RAM;
