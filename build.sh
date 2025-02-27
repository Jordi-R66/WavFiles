gcc -std=c23 -O3 -s -masm=intel main.c wav_structs.c mono.c -o main.elf
gcc -std=c23 -O3 -s -masm=intel main.c wav_structs.c mono.c -S