% 画质心位置
tBegin = 1;
tEnd = 7200;
num = 5;
% 补充前95秒的质心位置
for i = 1:num
    for j = 1:94
        pos(i,j,:) = [0.173913036060952e-8, 0.086956520938068e-8, 0.493560429809511e-8];
    end
    % 补充后段时间质心位置
end
% plot3(pos(tBegin:tEnd,1),pos(tBegin:tEnd,2),pos(tBegin:tEnd,3),'-')
% hold on
% plot3(idealPlanePathData(tBegin:tEnd,1),idealPlanePathData(tBegin:tEnd,2),idealPlanePathData(tBegin:tEnd,3),'-')
% hold on
% legend("实际质心位置","理想质心位置")
