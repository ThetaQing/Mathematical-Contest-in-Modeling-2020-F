% �������ٶ��Ż�ģ��ʵ��
mInit = [255,1275,1785,1615,2210,680]';
vInit = [1.1, 1.8, 1.7, 1.5, 1.6, 1.1];
load("haoyou.mat");

T = 1;
num = 100;  % ��������
Q2pos = zeros(num,7200,3);
Q2method = zeros(num,100,4);
count = 1;
numCount = 1;
box = randi(6,1,2);  % �����������
while(numCount<num)
    while(T < 6200)  % ��֤����ʱ��    
        t = randi([60,100]);  % �����������
        rate = 1;
        if(box(1) == box(2))  % ����������һ��������
             p1 = 1;
        else
            p1 = rand(1);  % �������1
        end
        flag = 1;  % ��û�гɹ�ȡ������������ֵ    

        if(T>5927)
            v1 = p1*rate*haoyou(T:T+t)+0.0001;  % T��ʾ��ʼʱ��
            v2 = 0*haoyou(T:T+t);
        else
            v1 = p1*rate*haoyou(T:T+t);  % T��ʾ��ʼʱ��
            v2 = rate*haoyou(T:T+t) - v1;  
        end    
        box = randi(6,1,2);  % �����������
        % ���������
        while(flag)            
            box = randi(6,1,2);  % �����������
            p1 = rand(1);  % �������1
            v1 = p1*rate*haoyou(T:T+t);  % T��ʾ��ʼʱ��
            v2 = rate*haoyou(T:T+t) - v1;  
            mMust1 = sum(v1);
            mMust2 = sum(v2); 
            % ������ɺ��ʵ�����
            while (box(1) == 1 && box(2) == 6) || (box(1) == 6 && box(2) == 1)
                box = randi(6,1,2);  % �����������,����ͬʱ����������������
            end
            % �ж��������Ƿ�����
            while(mMust1 > mInit(box(1)) ||mMust2 > mInit(box(2)))
                box = randi(6,1,2);
            end
            % �ж������ٶ��Ƿ�����
            if(box(1)==box(2))
                vFlag1 = max(haoyou(T:T+t)) < max(max(v1),max(v2));
                vFlag2 = vFlag1;
            else
                vFlag1 = vInit(box(1)) > max(v1);
                vFlag2 = vInit(box(2)) > max(v2);
            end
            if(vFlag1 && vFlag2)  % ��������Ĺ����ٶȶ�С��������
                if(box(1) == 1 && box(2) == 2)  % ͬʱ��1 2�������
                    vFlag3 = vInit(box(2)) > max(haoyou(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 12����           
                    end
                elseif(box(1) == 2 && box(2) == 1)
                    vFlag3 = vInit(box(1)) > max(haoyou(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 12����           
                    end
                elseif(box(1) == 5 && box(2) == 6)
                    vFlag3 = vInit(box(1)) > max(haoyou(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 56����           
                    end
                elseif(box(1) == 6 && box(2) == 5)
                    vFlag3 = vInit(box(2)) > max(haoyou(T:T+t));
                    if(vFlag1 && vFlag2 && vFlag3)
                        flag = 0;  % 56����           
                    end
                else            
                    flag = 0;  % ����12��56���
                end
            end
        end
        
        [Q2pos(numCount,T:T+t+1,:),mInit] = getCentroid(box,[v1';v2'],mInit);

        % ����
        Q2method(numCount,count,:) = [T,p1,box];
        count = count + 1;

        T = T + t+1  % ��һ����Ҫ���͵�ʱ��
    end
    % ���ݸ�����һ��
    numCount = numCount + 1
    T = 1;
    flag = 1;
    count = 1;
    mInit = [255,1275,1785,1615,2210,680]';
   
end
