num = 100;
load("idealPlanePathData.mat")
singlePos = zeros(7200,3);
deltaD = zeros(num,7200);
deltaMax = zeros(1,num);
for i = 1:num
    singlePos(:,:) = Q2pos(i,:,:);
    for  j = 1:7200
        tempX = (singlePos(j,1)-idealPlanePathData(j,1))^2;
        tempY = (singlePos(j,2)-idealPlanePathData(j,2))^2;
        tempZ = (singlePos(j,3)-idealPlanePathData(j,3))^2;
        deltaD(i,j) = sqrt(tempX + tempY + tempZ);
    end
    deltaMax(i) = max(deltaD(i,:));   

end
[x,y] = find(deltaMax==min(deltaMax))  % 求解最优解出现的位置
