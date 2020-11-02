function [Mm_plane]=centroid_plane(Mm,V_left)
%Mm 6个油箱的质心(6*3)
%V_left 剩余油量
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%m_left=V_left*850;
load('INIT.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

X=mx_all/M;
Y=my_all/M;
Z=mz_all/M;
Mm_plane=[X,Y,Z];