mode(7);
// Polinomios
// um polinomio definido pelas raizes
p=poly([1 2],'s')
// um polinomio definido pelos coeficientes
q=poly([1 2],'s','c')
// soma de polinomios
p+q
// multiplicacao de polinomios
p*q
// divisao de polinomios
q/p
// polinomio definido pela equacao caracteristica de uma matriz
poly([1 2; 3 4],'s')
// sera que eh?
det(%s*eye(2,2)-[1 2; 3 4])
// s eh um polinomio de raiz zero
s=poly(0,'s')
// matrizes de polinomios
A=[1 s; s 1+s^2], B=[1/s 1/(1+s); 1/(1+s) 1/s^2]
// fim
mode(0);
