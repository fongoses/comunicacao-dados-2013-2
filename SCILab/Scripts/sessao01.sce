mode(7);
// Primeira sessao no Scilab (parte 1)
// define variável
a = 1;
// define outra variável (case sensitive)
A = 2;
// soma
a + A
// dois comandos na mesma linha
c = [1 2]; b=1.5
// um comando em diversas linhas
u = 1000000*(a*sin(A))^2+...
2000000*a*b*sin(A)*cos(A)+...
1000000*(b*cos(A))^2
// lista de variaveis no workspace
who
// definindo uma matriz
I = 1:3
// definindo uma matriz de números aleatórios
W = rand(2,4)
// pega-se parte da matriz
W(1,I)
// outra parte da matriz
W(:,I)
// outra parte da matriz (encore)
W($,$-1)
// raiz quadrada de matriz e numero complexo
sqrt([4 -4])
// fim
mode(0);

