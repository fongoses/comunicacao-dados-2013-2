mode(7);
// Indexacao de matrizes e listas
// uma matriz
A = [1 2 3; 4 5 6]
// pega o elemento (1,2)
A(1,2)
// o que esta fazendo abaixo?
A([1 1],2)
// pega coluna
A(:,2)
// inverte as colunas
A(:,3:-1:1)
// um elemento
A(1)
// eh valido escrever A(6)?
A(6)
// estica a matriz
A(:)
// seleciona elementos da matriz esticada com booleano
A([%t %f %f %t])
// qual seria o resulado de A([%t %f],[2 3])?
A([%t %f],[2 3])
// $ indica o ultimo elemento
A(1:2,$-1)
// qual o resultado de A($:-1:1,2)?
A($:-1:1,2)
// ultimo elemento da matriz esticada
A($)
// modificacoes da matriz A
A
// modifica elemento
A(1,2) = 10
// qual o efeito de A([1 1],2) = [-1; -2]?
A([1 1],2) = [-1; -2]
// substitui coluna
A(:,1) = [8;5]
// substitui primeira linha de forma inversa
A(1,3:-1:1)=[77 44 99]
// substitui toda a primeira linha
A(1,:) = 10
// substitui na matriz esticada
A(1) = %s
// qual o efeito de A(3) = %s+1 ?
A(3) = %s+1
// modifica os elementos usando a matriz esticada
A(:)=1:6
// o que faz A([%t %f],1)=33 ?
A([%t %f],1)=33
// o que faz A(1:2,$-1) = [2;4] ?
A(1:2,$-1) = [2;4]
// o que faz A($:-1:1,1) = [8;7] ?
A($:-1:1,1) = [8;7]
// o que faz A($) = 123 ?
A($) = 123
// uma string
x = 'test'
// multiplicacao
x([1 1; 1 1; 1 1])
// o que faz x([4 5]) = ['4','5'] ?
x([4 5]) = ['4','5']
x(1)
x(2)
x(3)
x(4)
x(5)
// qual o resultado de x(4)+x(5) ?
x(4)+x(5)
// fim
mode(0);
