% ������λ��
tBegin = 1;
tEnd = 7200;
num = 19;
% ����ǰ95�������λ��
% for i = 1:num
%     for j = 1:94
%         Q2pos(i,j,:) = [0.173913036060952e-8, 0.086956520938068e-8, 0.493560429809511e-8];
%     end
%     % ������ʱ������λ��
% end
numPos = zeros(7200,3);
numPos(:,:) = Q2pos(num,:,:);
plot3(numPos(tBegin:tEnd,1),numPos(tBegin:tEnd,2),numPos(tBegin:tEnd,3),'.')
hold on
plot3(idealPlanePathData(tBegin:tEnd,1),idealPlanePathData(tBegin:tEnd,2),idealPlanePathData(tBegin:tEnd,3),'.')
hold on
legend("ʵ������λ��","��������λ��")
