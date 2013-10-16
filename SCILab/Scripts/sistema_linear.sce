mode(7);
// Sistemas lineares
// definindo-se um sistema linear por matrizes de espaço de estados
A=[0 -1;1 -3]; B=[0;1]; c=[-1 0];
Sys = syslin('c',A,B,C)
Sys.A
Sys.B
// transformacao para funcao de transferencia
hs = ss2tf(Sys)
hs.num
hs.den
// define a variavel dos polinomios
s=poly(0,'s')
// define os quocientes de polinomio
S1=1/(s-1)
S2=1/(s-2)
// define os sistemas
G1=syslin('c',S1)
G2=syslin('c',S2)
// transforma G1 para espaco de estados
G1s = tf2ss(G1)
// mostra formatado na tela
ssprint(G1s)
// interconexao de sistemas
// serie ou cascata
G1*G2
// paralelo com 1  entrada
G1+G2
// paralelo com 2 entradas
[G1,G2]
// paralelo com 1 entrada e 2 saidas
[G1;G2]
// realimentacao
G1/.G2
// fim
mode(0);
