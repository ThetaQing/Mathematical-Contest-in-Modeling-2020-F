function [x y z]=state1(a,b,c,alpha,v,x0,y0,z0)
c1=(v/850)/(a*b)-0.5*a*tand(alpha);
c2=c1+a*tand(alpha);
A=[cosd(alpha) 0 -sind(alpha) 0
       0      1      0      0
   sind(alpha) 0 cosd(alpha)  0
       0      0      0      1];
u=[x0,y0,z0,1]*A;
x1=u(1);
y1=u(2);
z1=u(3);
u1=[x1+0.5*a,y1+0.5*b,z1-0.5*c];
u2=[x1-0.5*a,y1+0.5*b,z1-0.5*c];
u3=[x1-0.5*a,y1+0.5*b,z1-0.5*c+c2];
u4=[x1+0.5*a,y1+0.5*b,z1-0.5*c+c1];
x=(1/4)*(u1(1)+u2(1)+u3(1)+u4(1));
y=(1/4)*(u1(2)+u2(2)+u3(2)+u4(2))-0.5*b;
z=(1/4)*(u1(3)+u2(3)+u3(3)+u4(3));
