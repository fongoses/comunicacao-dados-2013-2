mode(7);
// Primeira sessao no Scilab (parte 3)
// define de um sistema linear na forma de espaco de estados
A = [-1,0;1, 2]; B = [1,2;2,3]; C=[1,0];
S1 = syslin('c', A, B, C)
// transformacao em funcao de transferencia
ss2tf(S1)
// define um sistema linear como uma matriz de transferencia
R = [1/s, s/(1+s), s^2];
S1 = syslin('c', R)
// transformacao em espaco de estados
tf2ss(S1)
// operacao com sistema linear
sl1 = [S1; 2*S1+eye()]
size(sl1)
size(tf2ss(sl1))
// fim
mode(0);
