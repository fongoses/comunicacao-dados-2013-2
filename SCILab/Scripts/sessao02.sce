mode(7);
// Primeira sessao no Scilab (parte 2)
// p eh um polinomio em z com coeficientes 1 2 3
p=poly([1 2 3],'z','coeff')
// outra forma de se definir um polinomio
// s é um polinomio de raiz zero
s = poly(0,'s')
// p é definido a partir de s
p = 1+2*s+s^2
// matriz de polinomio
M = [s, s; 1, s+1]
// determinante da matriz de polinomio
det(M)
// matriz de razao de polinomios
F = [1/s, (s+1)/(1-s); s/p, s^2]
// numeradores
F.num
// denominadores
F.den
// pega um elemento especifico de F
F21 = F(2,1)
// define uma faixa de frequencias
v = 0:0.01:%pi; frequencias = exp(%i*v);
// calcula a resposta em frequencia de F21
resposta = freq(F21.num, F21.den, frequencias);
// desenha na tela
plot2d(v, abs(resposta), style=-1, rect=[0, 0, 3.5, 0.7], nax=[5, 4, 5, 7]);
xtitle(' ', 'radianos', 'amplitude');
// horner = mudanca de variaveis para um polinomio
// aqui se faz ans = f(w(s))
w = (1-s)/(1+s), f = 1/p, horner(f,w)
// fim
mode(0);
