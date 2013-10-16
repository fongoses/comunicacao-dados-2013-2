mode(7);
// Primeira sessao no Scilab (parte 4)
// definicao de uma funcao on line
// Dado um sistema linear S1 e as matrizes de ganho
// do controlador Kr e do observador Ko
// constroi o sistema de malha fechada S2
function S2 = compen(S1, Kr, Ko)
[A,B,C,D] = abcd(S1);
A1 = [A-B*Kr, B*Kr; 0*A, A-Ko*C];
B1 = [B; 0*B];
C1 = [C, 0*C];
S2 = syslin('c',A1,B1,C1);
endfunction
// Entra um sistema linear como espaco de estados
A = [1, 1; 0, 1]; B = [0; 1]; C = [1, 0];
S1 = syslin('c',A,B,C)
// calcula o sistema em malha fechada
S2 = compen(S1, ppol(A,B,[-1,-1]), ppol(A',C',[-1+%i,-1-%i])');
// matriz A do sistema em malha fechada
Aclosed= S2.A
// autovalores em malha fechada
spec(Aclosed)
// fim
mode(0);
