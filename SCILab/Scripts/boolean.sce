mode(7);
// Matrizes booleanas
// constante booleana
%t
// resultado de uma comparacao
[1,2] == [1,3]
// outro resultado de comparacao
[1,2] == 1
// selecao de valores
a=[1 2 5 1 2 3 4 1 6]; a(a>2)
// operacoes logicas
A=[%t,%f,%t,%f,%f,%f];
B=[%t,%f,%t,%f,%t,%t];
A|B
A&B
// fim
mode(0);