mode(7);
// Listas e listas tipadas
// uma lista
L=list(1,'w',eye(2,2))
// extraindo elemento 3 de L
L(3)
// extraindo entrada 2,2 do elemento L(3)
L(3)(2,2)
// redefinindo-se elemento 2 de L
L(2)=list('w',rand(2,2))
// cria-se uma lista aninhada
// extrai-se elemento 1,2 da entrada 2 de L(2)
L(2)(2)(1,2)
// redefine-se o elemento acima
L(2)(2)(1,2)=5
// listas tipadas possuem uma primeira entrada tipica
L=tlist(['Car';'Name';'Dimensions'],'Nevada',[2,3])
// uso de uma lista tipada
L.Name
L.Dimensions(1,2)
L(1)(1)
// fim
mode(0);