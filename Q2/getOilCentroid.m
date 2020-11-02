function tOilPosition = getOilCentroid(num,m)
load('INIT.mat')

tOilPosition=getInitOilBoxCentroidPosition();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   获取tBegin -- tEnd 时时间以第num油箱供油后，该油箱内油的质心    %%%%%%%%%%%%%%%%%%%
  
tOilPosition(num,3) = INIT(num,3)-0.5*INIT(num,6)+0.5*m/(850*INIT(num,4)*INIT(num,5));    % 第num个油箱内油的质心在Z方向的变化
