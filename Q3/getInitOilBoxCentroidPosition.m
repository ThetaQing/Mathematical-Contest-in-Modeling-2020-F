function initOilPosition =getInitOilBoxCentroidPosition()
%%%%%%%%%%%%% ��ȡ��ʼ�������͵�����  %%%%%%%%%%%%%%%%%%%%%
x=zeros();%x(t,6)
y=zeros();
z=zeros();
load('INIT.mat')
initOilPosition=zeros(6,3);

for i=1:6
    x(i)=INIT(i,1); % ��i�������x��y��z����
    y(i)=INIT(i,2);
    z(i)=INIT(i,3)-0.5*INIT(i,6)+0.5*(INIT(i,7)/(INIT(i,4)*INIT(i,5)));
    initOilPosition(i,:)=[x(i),y(i),z(i)];%%%��ʼ�������͵�����
end