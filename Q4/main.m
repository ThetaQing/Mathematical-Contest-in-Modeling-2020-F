mInit = [255,1275,1785,1615,2210,680]';
vInit = [1.1, 1.8, 1.7, 1.5, 1.6, 1.1];
load("Q4haoyou.mat");
T = 1;
num = 5000;
pos = zeros(num,7200,3);
method = zeros(num,100,4);
count = 1;
numCount = 1;
box = randi(6,1,2);  % 随机生成油箱
while(numCount<num)
    while(T < 6200) 
        t = randi([60,120]); 
        rate = 1;
        if(box(1) == box(2))  % 生成了两个一样的油箱
             p1 = 1;
        else
            p1 = rand(1);  % 随机比例1
        end
        flag = 1;  
        if(T>5970)
            v1 = p1*rate*Q4haoyou(T:T+t)+0.0001;  % T表示开始时间
            v2 = 0*Q4haoyou(T:T+t);
        else
            v1 = p1*rate*Q4haoyou(T:T+t);  % T表示开始时间
            v2 = rate*Q4haoyou(T:T+t) - v1;  
        end        
        box = randi(6,1,2); 
        while(flag)            
            box = randi(6,1,2); 
            if(box(1) == box(2)) 
                p1 = 1;
            else
                p1 = rand(1); 
            end
            v1 = p1*rate*Q4haoyou(T:T+t);
            v2 = rate*Q4haoyou(T:T+t) - v1;  
            mMust1 = sum(v1);
            mMust2 = sum(v2); 
            while (box(1) == 1 && box(2) == 6) || (box(1) == 6 && box(2) == 1)
                box = randi(6,1,2);  
            end
            while(mMust1 > mInit(box(1)) ||mMust2 > mInit(box(2)))
                box = randi(6,1,2);
            end
            if(box(1)==box(2))
                vFlag1 = max(Q4haoyou(T:T+t)) < max(max(v1),max(v2));
                vFlag2 = vFlag1;
            else
                vFlag1 = vInit(box(1)) > max(v1);
                vFlag2 = vInit(box(2)) > max(v2);
            end
            if(vFlag1 && vFlag2)  
                if(box(1) == 1 && box(2) == 2) 
                    vFlag3 = vInit(box(2)) > max(Q4haoyou(T:T+t));
                    if(vFlag3)
                        flag = 0; 
                    end
                elseif(box(1) == 2 && box(2) == 1)
                    vFlag3 = vInit(box(1)) > max(Q4haoyou(T:T+t));
                    if(vFlag3)
                        flag = 0; 
                    end
                elseif(box(1) == 5 && box(2) == 6)
                    vFlag3 = vInit(box(1)) > max(Q4haoyou(T:T+t));
                    if(vFlag3)
                        flag = 0; 
                    end
                elseif(box(1) == 6 && box(2) == 5)
                    vFlag3 = vInit(box(2)) > max(Q4haoyou(T:T+t));
                    if(vFlag1 && vFlag2 && vFlag3)
                        flag = 0; 
                    end
                else            
                    flag = 0;
                end
            end
        end
        [pos(numCount,T:T+t+1,:),mInit] = getCentroid(box,[v1';v2'],mInit);
        method(numCount,count,:) = [T,p1,box];
        count = count + 1;
        T = T + t+1; 
    end
    numCount = numCount + 1
    T = 1;
    count = 1;
    flag = 1;
    mInit = [255,1275,1785,1615,2210,680]';
   
end
