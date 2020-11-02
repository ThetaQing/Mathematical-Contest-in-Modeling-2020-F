% 根据给定的策略获取各个油箱的供油曲线
oil = zeros(100,4);
Q3oilBoxV = zeros(7200,6);
num1 = 1;
num2 = 1;
oil(:,:) = Q3method(2,:,:);
% 把耗油方法写入表中
for j = 1:99
    num1 = oil(j,3);
    num2 = oil(j,4);
    if(oil(j,1) == 0)
        break;
    end
    Q3oilBoxV(oil(j,1):(oil(j+1,1)-1),num1) = oil(j,2)*q3OilConsume(oil(j,1):oil(j+1,1)-1);
    if(num1==num2)
        continue;
    else
        Q3oilBoxV(oil(j,1):oil(j+1,1)-1,num2) = (1-oil(j,2))*q3OilConsume(oil(j,1):oil(j+1,1)-1);
    end
end
Q3oilBoxV(:,2) = Q3oilBoxV(:,2) + Q3oilBoxV(:,1);  % 更正油箱2的供油
Q3oilBoxV(:,5) = Q3oilBoxV(:,5) + Q3oilBoxV(:,6);  % 更正油箱6的供油

