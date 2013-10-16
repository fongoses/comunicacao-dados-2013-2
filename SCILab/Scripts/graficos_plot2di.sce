// Exemplos de uso de plot2di
xbasc();
t=(1:0.1:8)'; xset("font",2,3);
subplot(2,2,1);
plot2d([t t], [1.5+0.2*sin(t), 2+cos(t)]);
xtitle('Plot2d - Piecewise linear');
subplot(2,2,2);
plot2d([t t], [1.5+0.2*sin(t), 2+cos(t)],logflag='ll');
xtitle('Plot2d1 - Logarithmic scales');
subplot(2,2,3);
plot2d2(t, [1.5+0.2*sin(t), 2+cos(t)]);
xtitle('Plot2d2 - Piecewise constant');
subplot(2,2,4);
plot2d3(t, [1.5+0.2*sin(t), 2+cos(t)]);
xtitle('Plot2d3 - Vertical bar plot');
// volta ao padrão
xset('default');

