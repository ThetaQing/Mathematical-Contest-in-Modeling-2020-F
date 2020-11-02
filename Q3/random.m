mInit = [7.561153490360498e+02;
7.587499955104199e+02;
1.517341237962881e+03;
1.524955776824620e+03;
1.526241966991056e+03;
1.639595673674974e+03];  % 根据generateM.m求解的最佳初始质量
vInit = [1.1, 1.8, 1.7, 1.5, 1.6, 1.1];  % 油箱最大供油速度
load("q3OilConsume.mat");

T = 1;
num = 3;
Q3pos = zeros(num,7200,3);
Q3method = zeros(num,100,4);
count = 1;
numCount = 1;
while(numCount<num)
    while(T < 5600)  % 保证供油时间
        
        t = randi([60,100]);  % 随机生成整数        
        
        rate = 1;
        p1 = rand(1);  % 随机比例1
        flag = 1;  % 还没有成功取到满足条件的值    
        if(T>5312)
            v1 = p1*rate*q3OilConsume(T:T+t)+0.0001;  % T表示开始时间
            v2 = 0*q3OilConsume(T:T+t);
        else
            v1 = p1*rate*q3OilConsume(T:T+t);  % T表示开始时间
            v2 = rate*q3OilConsume(T:T+t) - v1;  
        end
        box = randi(6,1,2);  % 随机生成油箱
        % 生成随机数
        while(flag)            
            box = randi(6,1,2);  % 随机生成油箱
            if(box(1) == box(2))  % 生成了两个一样的油箱
                p1 = 1;
            else
                p1 = rand(1);  % 随机比例1
            end
            v1 = p1*rate*q3OilConsume(T:T+t);  % T表示开始时间            
            v2 = rate*q3OilConsume(T:T+t) - v1;  
            
            mMust1 = sum(v1);
            mMust2 = sum(v2); 
            % 随机生成合适的油箱
            while (box(1) == 1 && box(2) == 6) || (box(1) == 6 && box(2) == 1)
                box = randi(6,1,2);  % 随机生成油箱,不能同时启动两个备用邮箱
            end
            % 判断油箱内是否还有油
            while(mMust1 > mInit(box(1)) ||mMust2 > mInit(box(2)))
                box = randi(6,1,2);
            end
            % 判断油箱速度是否满足
            if(box(1)==box(2))
                vFlag1 = max(q3OilConsume(T:T+t)) < max(max(v1),max(v2));
                vFlag2 = vFlag1;
            else
                vFlag1 = vInit(box(1)) > max(v1);
                vFlag2 = vInit(box(2)) > max(v2);
            end
%             vFlag1 = isempty(find((vInit(box(1))-v1)<0));  % 小于0的速度是否为空，返回1，表述数组中吴负数
%             vFlag2 = isempty(find((vInit(box(2))-v2)<0));
            if(vFlag1 && vFlag2)  % 备用邮箱的供油速度都小于主油箱
                if(box(1) == 1 && box(2) == 2)  % 同时是1 2的情况下
                    vFlag3 = vInit(box(2)) > max(q3OilConsume(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 12可行           
                    end
                elseif(box(1) == 2 && box(2) == 1)
                    vFlag3 = vInit(box(1)) > max(q3OilConsume(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 12可行           
                    end
                elseif(box(1) == 5 && box(2) == 6)
                    vFlag3 = vInit(box(1)) > max(q3OilConsume(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 56可行           
                    end
                elseif(box(1) == 6 && box(2) == 5)
                    vFlag3 = vInit(box(2)) > max(q3OilConsume(T:T+t));
                    if(vFlag3)
                        flag = 0;  % 56可行           
                    end              
                    
                else            
                    flag = 0;  % 不是12、56组合
                end
            end
        end
        
        [Q3pos(numCount,T:T+t+1,:),mInit] = getCentroid(box,[v1';v2'],mInit);

        % 后续
        Q3method(numCount,count,:) = [T,p1,box];
        count = count + 1;

        T = T + t+1  % 下一秒需要供油的时间
    end
    % 数据更新下一次
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
