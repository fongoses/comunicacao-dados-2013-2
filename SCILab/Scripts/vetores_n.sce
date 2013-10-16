mode(7);
// Vetores N-dimensionais
// simples definicao de um vetor n-dimensional
M1(2,2,2) = 3
// redefinicao de elemento
M1(:,:,1) = eye(2,2)
// extracao de elemento
M1(2,2,:)
// obtem dimensoes
size(M1)
// qual a terceira dimensao de M?
size(M1,3)
// outra forma de definir uma tal matriz
M1=hypermat([2,3,2],1:12)
// [2 3 2] -> dimensao
// 2o argumento de hypermat -> vetor de dados
// tambem eh uma lista tipada com campos
M1.dims
M1.entries
// fim
mode(0);