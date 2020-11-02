function initOilPosition =getInitOilBoxCentroidPosition()
%%%%%%%%%%%%% 获取初始油箱内油的质心  %%%%%%%%%%%%%%%%%%%%%
x=zeros();%x(t,6)
y=zeros();
z=zeros();
load('INIT.mat')
initOilPosition=zeros(6,3);

for i=1:6
    x(i)=INIT(i,1); % 第i个油箱的x、y、z坐标
    y(i)=INIT(i,2);
    z(i)=INIT(i,3)-0.5*INIT(i,6)+0.5*(INIT(i,7)/(INIT(i,4)*INIT(i,5)));
    initOilPosition(i,:)=[x(i),y(i),z(i)];%%%初始油箱内油的质心
end