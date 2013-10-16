mode(7);
// Primeira sessao no Scilab (parte 5)
// salvando o ambiente no arquivo de nome : meuarquivo
save('meuarquivo')
// Solicita ao sistema operacional um comando de sistema
unix_s('rm meuarquivo')
// Solicita ao sistema operacional um comando, sendo que
// a saida deve ser na janela do scilab
unix_w('date')
// outra saida
unix_w('ls')
// define funcao em C em matriz de caracteres
foo = ['void foo(a, b, c)'; 'double *a, *b, *c;'; '{*c = *a + *b;}']
// copia para arquivo
unix_s('rm foo.c');
write('foo.c',foo);
// compilando
unix_s('make foo.o');
// criando um link dinamico com o scilab
link('foo.o', 'foo', 'C');
// definicao de funcao no scilab por chamada de codigo C externo
deff('[c] = novo_mais(a, b)',...
	'c = call(''foo'',a,1,''d'',b,2,''d'',''out'',[1,1],3,''d'')')
// chamada da funcao criada
novo_mais(2,3)
// fim
mode(0);
