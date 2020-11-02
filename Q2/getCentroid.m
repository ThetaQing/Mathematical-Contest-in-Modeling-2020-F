function [placeCentroidPosition,mInitNext]= getCentroid(num,v,mInit)
% num�����飬�ڿ�ʼ������ʱ�����ٶ���v���͵ķɻ�����,��һʱ��ʣ������
%tEnd>400��t ʱ��
%m m_left
% v�Ǵ�tBegin(i)����ٶȿ�ʼ
%%%  %%%% �ڶ�����2�����乩��400s��Эͬ����
% �Ե�num�����乩�ͣ������ٶ�Ϊv������ʱ��Ϊ1��t��������ɺ������������λ��
len = length(v(1,:))+1;
cost = zeros(6,len);  % 6* len+1�ľ���
mLeft = zeros(6,len);
mSum = zeros(1,len);
xyzOil = zeros(6,3,len);
placeCentroidPosition = zeros(len,3);
% tBegin--tEnd ���ĵ���
for i = 1 : length(num)
    cost(num(i),:) = oilConsume(v(i,:));  % ��i������tʱ�̹���ʱ�����ĵ�����
end
% tBegin����tEndʣ�����
mLeft = mInit - cost;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   ��ȡtBegin -- tEnd ʱʱ���Ե�num���乩�ͺ󣬸��������͵�����    %%%%%%%%%%%%%%%%%%%

% ��ʣ�������ĺ�
mSum = sum(mLeft);  % ���ÿһ�����
% ��tʱ�̸����������͵�����λ��
for i = 1:len
    for num = 1 : 6
        tXYZ(:,:) = getOilCentroid(num,mLeft(num,i));  % ����6*3�ľ���
        xyzOil(num,:,i) = tXYZ(num,:);  % ȡ��num��
    end
end
% ��ά����ת��ά
for i = 1:len
    tXYZ = xyzOil(:,:,i);  % iʱ�̸������������λ��

    % Mi*Xi���ۼƺ�
    sumMmultiX = mLeft(:,i)'*tXYZ(:,1);
    sumMmultiY = mLeft(:,i)'*tXYZ(:,2);
    sumMmultiZ = mLeft(:,i)'*tXYZ(:,3);
    % ���������ļ���
    x = sumMmultiX / mSum(i);
    y = sumMmultiY / mSum(i);
    z = sumMmultiZ / mSum(i);
    placeCentroidPosition(i,:) = [x',y',z'];
end
mInitNext = mLeft(:,len);


