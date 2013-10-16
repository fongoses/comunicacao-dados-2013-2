// Estilo de desenho de pontos
xmax=5.;
x=0:0.1:xmax;
u=[-0.8+sin(x);-0.6+sin(x);-0.4+sin(x);-0.2+sin(x);sin(x)];
u=[u;0.2+sin(x);0.4+sin(x);0.6+sin(x);0.8+sin(x)]';
// u=[-0.8+sin(x),-0.6+sin(x)];
// plot2d(x,u);
plot2d(x,u,style=[-9,-8,-7,-6,-5,-4,-3,-2,-1,0]);
x=0:0.2:xmax;
v=[1.4+sin(x);1.8+sin(x)]';
xset("mark size",5);
plot2d(x,v,style=[-7,-8]);
xset('default');
