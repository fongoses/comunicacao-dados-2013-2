kp=xget("pixmap");xset("pixmap",1);
t=-%pi:0.3:%pi;
for i=20:-1:1,
  xset("wwpc");
  plot3d(t,t,sin((i/10)*t)'*cos((i/10)*t),35,45," ",[2,2,4])
  xset("wshow");
end
xset("pixmap",kp);



