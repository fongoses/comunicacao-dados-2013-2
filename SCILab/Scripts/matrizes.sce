mode(7);
// Matrizes
// alguns escalares
a=5+2*%i; B=-5-%i; b =-4-2*%i;
a+B
a+b
// Vetores
// virgulas e espacos separam colunas
v = [2,-3+%i,7]
// vetor transposto
v'
// ponto e virgulas separam linhas
w=[-3;-3-%i;2]
// soma
v'+w
// produto
v*w
// produto elemento-a-elemento
w'.*v
// o papel do espaco em branco para definir colunas
v=[1 +3]
v=[1 + 3]
v=[1+ 3]
u=[1,+ 8- 7];
// e agora?
u
// definir um vetor por incremento
v=5:-.5:3
// outro vetor
v=[1 5 6];
// um vetor de uns
ones(v)
// outro vetor de uns
ones(v')
// outro vetor de uns (encore)
ones(1:4)
// um vetor de tres
3*ones(1:4)
// um vetor de zeros
zeros(v')
// outro vetor de zeros
zeros(1:5)
// Matrizes
// duas matrizes
A=[2 1 4; 5 -8 2], b=[1 2 1;0 4 0]
// multiplicacao elemento-a-elemento
A.*b
// muliplicacao
A*b'
// Outras matrizes
A=[1 2; 3 4]; B=[5 6; 7 8]; C=[9 10; 11 12];
// Construcao de matriz por concatenacao
D=[A,B,C]
E=[A;B;C];
// E agora?
E
// Outra forma de definir matriz
D
F=matrix(D,3,4)
// Matriz identidade  "expandida"
G=eye(F)
// outra matriz identidade "expandida"
H=eye(4,3)
// uma matriz de caracteres
A=['x','y';'z','w+v']
// triangularizacao simbolica de A
At = trianfml(A)
// substituicao dos caracteres
x=1;y=2;z=3;w=4;v=5;
evstr(At)
// fim
mode(0);
