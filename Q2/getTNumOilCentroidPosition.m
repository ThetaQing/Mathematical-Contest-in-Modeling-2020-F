function tNumOilPosition = getTNumOilCentroidPosition(num,tBegin,tEnd,v)

%num 第几个油箱
%m 此时油箱的剩余油量
%tBegin 开始供油时间
%tEnd ：结束供油时间段,注意和原表有表头的区别，这里是去除表头的行数
%v：tBegin——tEnd 时间段每秒的速度矩阵
%%% 获取tBegin -- tEnd 时间段第num个油箱以供油速度v供油时，t时刻的质心 %%%
load('INIT.mat')
tOil=zeros(6,3,length(v)+1);
tOilPosition=getInitOilBoxCentroidPosition();
mNumOilLeft = getTNumBoxOilLeft(num,tBegin,tEnd,v);
for t = tBegin : tEnd
    tOil(:,:,t - tBegin + 1) = tOilPosition(:,:);
end
tOil(:,:,tEnd + 1) = tOilPosition(:,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   获取tBegin -- tEnd 时时间以第num油箱供油后，该油箱内油的质心    %%%%%%%%%%%%%%%%%%%
for t = tBegin:tEnd    
    tOil(num,3,t - tBegin + 2) = INIT(num,3)-0.5*INIT(num,6)+0.5*mNumOilLeft(t-tBegin+1)/(850*INIT(num,4)*INIT(num,5));    % 第num个油箱内油的质心在Z方向的变化
end
tNumOilPosition = tOil(num,:,:);
%fprintf("第%d个油箱以速度矩阵v，在%d开始供油，到%d供油结束,期间所有的质心位置\n",num,tBegin,tEnd)


