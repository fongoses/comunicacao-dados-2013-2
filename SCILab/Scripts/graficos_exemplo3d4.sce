kp=xget("pixmap");xset("pixmap",1);
xset("wwpc");  // clean pixmap
t=%pi*(-5:5)/5;
//first plot, to fix boundaries
plot3d1(t,t,sin(t)'*cos(t),35,45," ",[1,2,4]);
xset("wshow"); // show pixmap
if driver()=='Pos' then st=4;else st=2;end;
for i=35:st:80, // loop on theta angle
  xset("wwpc");
  plot3d1(t,t,sin(t)'*cos(t),i,45," ",[1,0,4])
  xset("wshow");
end
for i=45:st:80, //loop on alpha angle
  xset("wwpc");
  plot3d1(t,t,sin(t)'*cos(t),80,i," ",[1,0,4])
  xset("wshow");
end
xset("pixmap",kp);


