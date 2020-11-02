function [placeCentroidPosition,mInitNext]= getCentroid(num,v,mInit)
% num油箱组，在开始到结束时间以速度组v供油的飞机质心,上一时刻剩余油量
%tEnd>400和t 时间
%m m_left
% v是从tBegin(i)秒的速度开始
%%%  %%%% 第二步，2号油箱供油400s后协同供油
% 以第num个油箱供油，供给速度为v，供给时间为1—t，供给完成后飞行器的质心位置
len = length(v(1,:))+1;
cost = zeros(6,len);  % 6* len+1的矩阵
mLeft = zeros(6,len);
mSum = zeros(1,len);
xyzOil = zeros(6,3,len);
placeCentroidPosition = zeros(len,3);
% tBegin--tEnd 消耗的油
for i = 1 : length(num)
    cost(num(i),:) = oilConsume(v(i,:));  % 第i个油箱t时刻供油时总消耗的油量
end
% tBegin——tEnd剩余的油
mLeft = mInit - cost;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   获取tBegin -- tEnd 时时间以第num油箱供油后，该油箱内油的质心    %%%%%%%%%%%%%%%%%%%

% 求剩余油量的和
mSum = sum(mLeft);  % 针对每一列求和
% 求t时刻各个油箱内油的质心位置
for i = 1:len
    for num = 1 : 6
        tXYZ(:,:) = getOilCentroid(num,mLeft(num,i));  % 返回6*3的矩阵
        xyzOil(num,:,i) = tXYZ(num,:);  % 取第num个
    end
end
% 高维数据转低维
for i = 1:len
    tXYZ = xyzOil(:,:,i);  % i时刻各个油箱的质心位置

    % Mi*Xi的累计和
    sumMmultiX = mLeft(:,i)'*tXYZ(:,1);
    sumMmultiY = mLeft(:,i)'*tXYZ(:,2);
    sumMmultiZ = mLeft(:,i)'*tXYZ(:,3);
    % 飞行器质心计算
    x = sumMmultiX / mSum(i);
    y = sumMmultiY / mSum(i);
    z = sumMmultiZ / mSum(i);
    placeCentroidPosition(i,:) = [x',y',z'];
end
mInitNext = mLeft(:,len);


