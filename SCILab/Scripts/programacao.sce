mode(7);
// Ferramentas de programacao
// loop for
x=1; for k=1:4, x=x*k, end
// loop for com vetor
x=1; for k=[-1 3 0], x=x+k, end
// loop for com listas
l=list('oi mundo',[1,2;3,4],786);
for k=l, disp(k), end
// loop while
x=1; while x<14, x=2*x, end
// comando break
a=0; for i=1:5:100,a=a+1, if i>10 then break, end; end
// loop aninhados
for k=1:3, for j=1:4; if k+j>4 then break; else disp(k); end; end; end;
// condicional if-then-else
x=1; if x>0 then, y=-x, else y=x, end
x=-1; if x>0 then, y=-x, else y=x, end
// cond. select case
x=-1; select x, case 1, y=x+5, case -1, y=sqrt(x), end
// fim
mode(0);