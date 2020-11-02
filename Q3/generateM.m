function mBest = generateM()
    num = 10000;
    m = zeros(6,num);
    pos = zeros(num+1,3);
    delta = zeros(1,num);
    idealPos = [0.257536716, -0.025245657, 0.016912227]; 
    for i = 1:num
        % �����������
        p = rand(1,5)*0.2;
        p6 = 1-sum(p);
        rate = [p,p6];
        % �����������
        mSum = randi([7660,8080]);
        mInit = (mSum)*rate';
        m(:,i) = mInit(:);
        [pos(i:i+1,:), mLeft]= getCentroid(1,0,mInit);
        delta(i) = sqrt((pos(i,1)-idealPos(1))^2+(pos(i,2)-idealPos(2))^2+(pos(i,3)-idealPos(3))^2);
    end
    [xM,yM] = find(delta == min(delta))  % �����ѳ�ʼ�������ֵĵ���λ��
    mBest = m(:,yM)  % ��ȡ��ѳ�ʼ����
