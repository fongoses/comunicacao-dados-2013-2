kp=xget("pixmap");xset("pixmap",1);
xset("wwpc");  // clean pixmap
getf SCI/demos/surface/Macros.sci
xset('pixmap',1)
U = linspace(0,3*%pi,60);
v = linspace(0,2*%pi,20);
n=size(U,'*');
for k=20:4:n
  u=U(1:k);
  x= (cos(u).*u)'*(1+cos(v)/2);
  y= (u/2)'*sin(v);
  z= (sin(u).*u)'*(1+cos(v)/2);
  xset('wwpc');
  plot3d2(x,y,z,-1,62,152,'X@Y@Z',[10,1,4],[-15 10 -5 5 -10 12])
  xset('wshow')
end
xset("pixmap",kp);
