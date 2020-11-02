function [x y z]=state2(a,b,c,alpha,v,x0,y0,z0)
a1=sqrt((2*a*c-(2*v/(b*850)))/tand(alpha));
c1=a1*tand(alpha);
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
u3=[x1-0.5*a,y1+0.5*b,z1+0.5*c];
u4=[x1+0.5*a-a1,y1+0.5*b,z1+0.5*c];
u5=[x1+0.5*a,y1+0.5*b,z1+0.5*c-c1];
x=(1/5)*(u1(1)+u2(1)+u3(1)+u4(1)+u5(1));
y=(1/5)*(u1(2)+u2(2)+u3(2)+u4(2)+u5(2))-0.5*b;
z=(1/5)*(u1(3)+u2(3)+u3(3)+u4(3)+u5(3));
