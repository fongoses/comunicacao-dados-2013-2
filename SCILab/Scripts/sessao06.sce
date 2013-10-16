mode(7);
// Primeira sessao no Scilab (parte 6)
// calcula a solucao de uma EDO
// define a funcao
function ydot = f(t,y),
ydot = [a-y(2)*y(2) -1; 1 0]*y,
endfunction
// parametros
a = 1; y0 = [1; 0]; t0 = 0; instantes = 0:0.02:20;
// resolve ode
y = ode(y0,t0,instantes,f);
// mostra gráficos
plot2d(y(1,:),y(2,:),style=-1,rect=[-3,-3,3,3],nax=[10,2,10,2]);
xtitle('Van der Pol');
// uma funcao sendo passada como parametro de outra funcao
function y=calcul(x,method), x=method(x);y=poly(x,'x'),endfunction
function z=meth1(x), z=x, endfunction
function z=meth2(x), z=2*x, endfunction
calcul([1,2,3],meth1)
calcul([1,2,3],meth2)
// fim
mode(0);
