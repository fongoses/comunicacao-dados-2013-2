// legendas nas figuras
xbasc();
xset("use color",0);
x=-5:0.1:5;
y1=sin(x);y2=cos(x);
X=[x;x]; Y=[y1;y2];
plot2d(X',Y', style=[-1 -3]',leg="caption1@caption2",...
rect=[-5,-1,5,1],nax=[2,10,5,5]);
xset('default');
