mInit = [7.561153490360498e+02;
7.587499955104199e+02;
1.517341237962881e+03;
1.524955776824620e+03;
1.526241966991056e+03;
1.639595673674974e+03];  % ����generateM.m������ѳ�ʼ����
vInit = [1.1, 1.8, 1.7, 1.5, 1.6, 1.1];  % ����������ٶ�
load("q3OilConsume.mat");

T = 1;
num = 3;
Q3pos = zeros(num,7200,3);
Q3method = zeros(num,100,4);
count = 1;
numCount = 1;
while(numCount<num)
    while(T < 5600)  % ��֤����ʱ��
        
        t = randi([60,100]);  % �����������        
        
        rate = 1;
        p1 = rand(1);  % �������1
        flag = 1;  % ��û�гɹ�ȡ������������ֵ    
        if(T>5312)
            v1 = p1*rate*q3OilConsume(T:T+t)+0.0001;  % T��ʾ��ʼʱ��
            v2 = 0*q3OilConsume(T:T+t);
        else
            v1 = p1*rate*q3OilConsume(T:T+t);  % T��ʾ��ʼʱ��
            v2 = rate*q3OilConsume(T:T+t) - v1;  
        end
        box = randi(6,1,2);  % �����������
        % ���������
        while(flag)            
            box = randi(6,1,2);  % �����������
            if(box(1) == box(2))  % ����������һ��������
                p1 = 1;
            else
                p1 = rand(1);  % �������1
            end
            v1 = p1*rate*q3OilConsume(T:T+t);  % T��ʾ��ʼʱ��            
            v2 = rate*q3OilConsume(T:T+t) - v1;  
            
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
                vFlag1 = max(q3OilConsume(T:T+t)) < max(max(v1),max(v2));
                vFlag2 = vFlag1;
            else
                vFlag1 = vInit(box(1)) > max(v1);
                vFlag2 = vInit(box(2)) > max(v2);
            end
%             vFlag1 = isempty(find((vInit(box(1))-v1)<0));  % С��0���ٶ��Ƿ�Ϊ�գ�����1�������������⸺��
%             vFlag2 = isempty(find((vInit(box(2))-v2)<0));
            if(vFlag1 && vFlag2)  % ��������Ĺ����ٶȶ�С��������
                if(box(1) == 1 && box(2) == 2)  % ͬʱ��1 2�������
                    vFlag3 = vInit(box(2)) > max(q3OilConsume(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 12����           
                    end
                elseif(box(1) == 2 && box(2) == 1)
                    vFlag3 = vInit(box(1)) > max(q3OilConsume(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 12����           
                    end
                elseif(box(1) == 5 && box(2) == 6)
                    vFlag3 = vInit(box(1)) > max(q3OilConsume(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 56����           
                    end
                elseif(box(1) == 6 && box(2) == 5)
                    vFlag3 = vInit(box(2)) > max(q3OilConsume(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 56����           
                    end              
                    
                else            
                    flag = 0;  % ����12��56���
                end
            end
        end
        
        [Q3pos(numCount,T:T+t+1,:),mInit] = getCentroid(box,[v1';v2'],mInit);

        % ����
        Q3method(numCount,count,:) = [T,p1,box];
        count = count + 1;

        T = T + t+1  % ��һ����Ҫ���͵�ʱ��
    end
    % ���ݸ�����һ��
    numCount = numCount + 1
    T = 1;
    flag = 1;
    count = 1;
    mInit = [7.561153490360498e+02;
7.587499955104199e+02;
1.517341237962881e+03;
1.524955776824620e+03;
1.526241966991056e+03;
1.639595673674974e+03];
   
end
