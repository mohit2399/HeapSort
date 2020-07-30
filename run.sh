echo -ne 'uint8_t arr[] = { ' >._a.c
cat $1 | sed -e 's/^#.*//g' \
    -e 's/MOV/4/g' \
    -e 's/SET/1/g' \
    -e 's/EXIT/0/g' \
    -e 's/PRINT/2/g' \
    -e 's/JMP/3/g' \
    -e 's/DEC/5/g' \
    -e 's/INC/6/g' \
    -e 's/SWAP/7/g' \
    -e 's/HEAP/8/g' \
    -e 's/\s/,/g' \
    -e '/^$/d' \
    -e 's/$/,/' >>._a.c
echo -ne '0 } ;' >>._a.c

gcc --std=c99 -o _b write.c
./_b asm.o
gcc --std=c99 -o bin main.c
./bin asm.o
rm _b ._a.c asm.o bin
