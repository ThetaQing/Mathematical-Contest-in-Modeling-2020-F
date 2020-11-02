num = 4999;%%%%%%%要改，改为num-1
singlePos = zeros(7200,3);
deltaD = zeros(num,7200);
deltaMax = zeros(1,num);
for i = 1:num
    singlePos(:,:) = pos(i,:,:);
    for  j = 95:7200
        tempX = (singlePos(j,1))^2;
        tempY = (singlePos(j,2))^2;
        tempZ = (singlePos(j,3))^2;
        deltaD(i,j) = sqrt(tempX + tempY + tempZ);
    end
    deltaMax(i) = max(deltaD(i,:));
    
%     figure()
%     plot3(deltaD(1,:),deltaD(2,:),deltaD(3,:),'*')
%     hold on   
end
%  legend("1","2","3")
[a,b] = find(deltaMax==min(deltaMax))