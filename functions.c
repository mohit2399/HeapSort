
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
	if (r->regs[9] == 1)
	{
		u8 des = r->ins[++r->ip];
		r->ip -= des;
	}
	return;
}

void f_dec(RAM *r)
{
	r->regs[8] -= 1;
}

void f_inc(RAM *r)
{
	r->regs[8] += 1;
}

void f_swap(RAM *r)
{
	r->regs[7] = r->regs[0];
	r->regs[0] = r->regs[r->regs[8]];
	r->regs[r->regs[8]] = r->regs[7];

	if (r->regs[8] < 1) //condition created for not jumping called with swap
	{
		r->regs[9] = 0;
	}
	++r->ip;
}

void f_heap(RAM *r)
{
	int arr[6];
	for (int i = 0; i < 6; i++)
	{
		arr[i] = r->regs[i];
	}

	for (int i = 1; i < 6; i++)
	{
		if (arr[i] > arr[(i - 1) / 2])
		{
			int j = i;
			while (arr[j] > arr[(j - 1) / 2])
			{
			    int temp=0;
			    temp=arr[j];
			    arr[j]=arr[(j - 1) / 2];
				arr[(j - 1) / 2]=arr[j];
				j = (j - 1) / 2;
			}
		}
	}

	for (int i = 0; i < 6; i++)
	{
		r->regs[i] = arr[i];
	}

	++r->ip;
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
