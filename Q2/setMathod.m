% ������
% 6�����䵥������
load("haoyou.mat") % ����3�����������ٶ�
load("question1OilProvideData.mat")  % ����2���乩������
load("idealPlanePathData.mat")  % ����3����2��������λ��
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

