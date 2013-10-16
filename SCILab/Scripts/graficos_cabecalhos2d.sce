// Cabecalhos e apresentacao
xbasc();
x=-%pi:0.1:%pi;
y1=sin(x);
y2=cos(x);
y3=x;
X=[x;x;x];
Y=[y1;y2;y3];
plot2d(X',Y',style=[-1 -2 -3],leg="caption1@caption2@caption3",...
rect=[-3,-3,3,2],nax=[2,10,2,5]);
xtitle(["General Title";"(with xtitle command)"],...
"x-axis title","y-axis title (with xtitle command)");
xgrid();
xclea(-2.7,1.5,1.5,1.5);
titlepage("Titlepage");
xstring(0.6,0.45,"(with titlepage command)");
xstring(0.05,0.7,["xstring command after";"xclea command"],0.1);
plot2d(X',Y',style=[-1 -2 -3],leg="caption1@caption2@caption3",...
rect=[-3,-3,3,2],nax=[2,10,2,5]);
xset('default');

