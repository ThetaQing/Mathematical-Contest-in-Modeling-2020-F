function tOilPosition = getOilCentroid(num,m)
load('INIT.mat')

tOilPosition=getInitOilBoxCentroidPosition();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   ��ȡtBegin -- tEnd ʱʱ���Ե�num���乩�ͺ󣬸��������͵�����    %%%%%%%%%%%%%%%%%%%
  
tOilPosition(num,3) = INIT(num,3)-0.5*INIT(num,6)+0.5*m/(850*INIT(num,4)*INIT(num,5));    % ��num���������͵�������Z����ı仯
