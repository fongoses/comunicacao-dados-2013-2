// graficos de controle
// aecc - 200309
xbasc();
s=poly(0,'s');
h=syslin('c',(s^2+2*0.9*10*s+100)/(s^2+2.0*0.9*15*s+225));
h1=h*syslin('c',(s^2+2*0.1*15.1*s+228.01)/(s^2+2*0.9*15*s+225));
// bode
subplot(2,2,1)
bode([h1;h],0.01,100);
// nyquist
subplot(2,2,2)
nyquist([h1;h]);
// chart and black
subplot(2,2,3)
black([h1;h],0.01,100,['h1';'h'])
chart([-8 -6 -4],[80 120],list(1,0));
// evans
subplot(2,2,4)
H=syslin('c',352*poly(-5,'s')/poly([0,0,2000,200,25,1],'s','c'));
evans(H,100);
xset('default');
