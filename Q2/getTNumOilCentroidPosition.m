function tNumOilPosition = getTNumOilCentroidPosition(num,tBegin,tEnd,v)

%num �ڼ�������
%m ��ʱ�����ʣ������
%tBegin ��ʼ����ʱ��
%tEnd ����������ʱ���,ע���ԭ���б�ͷ������������ȥ����ͷ������
%v��tBegin����tEnd ʱ���ÿ����ٶȾ���
%%% ��ȡtBegin -- tEnd ʱ��ε�num�������Թ����ٶ�v����ʱ��tʱ�̵����� %%%
load('INIT.mat')
tOil=zeros(6,3,length(v)+1);
tOilPosition=getInitOilBoxCentroidPosition();
mNumOilLeft = getTNumBoxOilLeft(num,tBegin,tEnd,v);
for t = tBegin : tEnd
    tOil(:,:,t - tBegin + 1) = tOilPosition(:,:);
end
tOil(:,:,tEnd + 1) = tOilPosition(:,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   ��ȡtBegin -- tEnd ʱʱ���Ե�num���乩�ͺ󣬸��������͵�����    %%%%%%%%%%%%%%%%%%%
for t = tBegin:tEnd    
    tOil(num,3,t - tBegin + 2) = INIT(num,3)-0.5*INIT(num,6)+0.5*mNumOilLeft(t-tBegin+1)/(850*INIT(num,4)*INIT(num,5));    % ��num���������͵�������Z����ı仯
end
tNumOilPosition = tOil(num,:,:);
%fprintf("��%d���������ٶȾ���v����%d��ʼ���ͣ���%d���ͽ���,�ڼ����е�����λ��\n",num,tBegin,tEnd)


