kp=xget("pixmap");xset("pixmap",1);
xselect() //raise graphic window
np=10;
t=0:0.1:np*%pi;
if driver()=='Pos' then st=1.5;else st=0.5;end
for i=1:st:30
  xset("wwpc");
  param3d((t/(np*%pi)*%pi).*sin(t),(t/(np*%pi)*%pi).*cos(t),...
      i*t/(np*%pi),35,45,'X@Y@Z',[2,4]);
  xset("wshow");
end
xset("pixmap",kp);
