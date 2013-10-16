mode(7);
// Diferente tipos de inteiros
// um vetor de numeros reais
x=[0 3.2 27 135 -12 -180];
// transforma em inteiro de 32 bits
int32(x)
// transforma em inteiro de 8 bits
int8(x)
// transforma em inteiro sem sinal de 8 bits
uint8(x)
// outro vetor
y=int32([2 5 285]);
// transforma em inteiro sem sinal de 8 bits
uint8(y)
// transforma em ponto flutuante
double(ans)
// outro vetor
x=int16([1 5 12]);
// ou lógico
x|int16(2)
// e logico
int16(14)&int16(2)
// negacao
~uint8(2)
// fim
mode(0);