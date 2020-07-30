
void f_mov(RAM *r)
{
	u8 src, val;
	src = r->ins[++r->ip];
	val = r->ins[++r->ip];
	L("mov command REGS[%d]:%d", src, val);
	r->regs[src] = val;
	return;
}

void f_exit(RAM *r)
{
	L("exit command");
	exit(EXIT_SUCCESS);
}

void f_set(RAM *r)
{
	u8 src, val;
	src = r->ins[++r->ip];
	val = r->ins[++r->ip];
	L("set command DATA[%d]:%d", src, val);
	r->storage[src] = val;
	return;
}

void f_print(RAM *r)
{
	int i = 0;
	L("print command first %d", r->regs[5]);
	for (; i <= r->regs[7]; i++)
		P("storage[%d]:%d regs[%d]:%d\n", i, r->storage[i], i, r->regs[i]);
	return;
}

void f_jmp(RAM *r)
{
	if (regs[9] == 1)
	{
		u8 res = r->regs[4];
		u8 des = r->ins[++r->ip];
		r->ip -= des;
	}
	return;
}

void f_dec(RAM *r)
{
	r--;
}

void f_inc(RAM *r)
{
	r++;
}

void f_swap(RAM *r)
{
	regs[7] = regs[0];
	regs[0] = regs[r->regs[8]];
	regs[r->regs[8]] = regs[7];

	if (regs[8] <= 1) //condition created for not jumping called with swap
	{
		regs[9] = 0;
	}
}

void f_heap(RAM *r)
{
	//
}

static void (*F[0xff])(RAM *r) = {
	[FUNC_SET] = f_set,
	[FUNC_EXIT] = f_exit,
	[FUNC_PRINT] = f_print,
	[FUNC_JMP] = f_jmp,
	[FUNC_MOV] = f_mov,
	[FUNC_DEC] = f_dec,
	[FUNC_INC] = f_inc,
	[FUNC_SWAP] = f_swap,
	[FUNC_HEAP] = f_heap,
};
