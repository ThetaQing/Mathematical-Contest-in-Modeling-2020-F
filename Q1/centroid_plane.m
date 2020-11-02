function [Mm_plane]=centroid_plane(Mm,V_left)
load('INIT.mat')
for i=1:6
    x(i)=Mm(i,1);
    y(i)=Mm(i,2);
    z(i)=Mm(i,3);
end
for i=1:6
    mx(i)=V_left(i)*x(i);
    my(i)=V_left(i)*y(i);
    mz(i)=V_left(i)*z(i);
end
mx_all=sum(mx(:));
my_all=sum(my(:));
mz_all=sum(mz(:));
M=sum(V_left(:));
disp(M)
X=mx_all/M;
Y=my_all/M;
Z=mz_all/M;
Mm_plane=[X,Y,Z];

(3) 剩余油量(质量)计算代码：根据初始油量及耗油速度计算
function [v]=V_left(t)
v=zeros(1,6);
m=zeros(t+1,6);
x=zeros();
x(1)=0;
load('Vi.mat')
load('INIT.mat')
m(1,:)=INIT(:,7)'*850;
A=[1 0 0 0 0 0 
    0 1 0 0 0 0
    0 0 1 0 0 0
    0 0 0 1 0 0
    0 0 0 0 1 0
    0 0 0 0 0 1];
for t1=1:t
    x(t1+1)=t1;
    m(t1+1,:)=m(t1,:)-Vi(t1,:)*A;
    
end
v(1,:)=m(t+1,:);
