function sum = oilConsume(v)
% ��tBegin��tEndʱ�������ٶ�v���ĵ�������
% ����ṹΪ(1,length(v)+1)������1s��Ľ��������sum(2)��
sum = zeros(1,length(v)+1);  
for i = 1:length(v)
    sum(i+1) = sum(i) + v(i);
end