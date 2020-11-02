% 主程序
% 6个油箱单独供油
load("haoyou.mat") % 附件3发动机耗油速度
load("question1OilProvideData.mat")  % 附件2油箱供油曲线
load("idealPlanePathData.mat")  % 附件3问题2理想质心位置
tBegin = 1;
tEnd = 737;
v = haoyou(tBegin:tEnd);  % 1:737
pos = zeros(3,length(v));

planePos = zeros(6,3,length(v));
for num = 1:6
    for i  = 1 : length(v)
        planePos(num,:,i) = getCentroidPosition(num,tBegin,tEnd,i,v);
    end
end

