% 根据给定的策略获取各个油箱的供油曲线
oil = zeros(100,4);
Q2oilBoxV = zeros(7200,6);
num1 = 1;
num2 = 1;
oil(:,:) = Q2method(18,:,:);
% 把耗油方法写入表中
for j = 1:99
    num1 = oil(j,3);
    num2 = oil(j,4);
    if(oil(j,1) == 0)
        break;
    end
    Q2oilBoxV(oil(j,1):(oil(j+1,1)-1),num1) = oil(j,2)*haoyou(oil(j,1):oil(j+1,1)-1);
    Q2oilBoxV(oil(j,1):oil(j+1,1)-1,num2) = (1-oil(j,2))*haoyou(oil(j,1):oil(j+1,1)-1);
end
Q2oilBoxV(:,2) = Q2oilBoxV(:,2) + Q2oilBoxV(:,1);  % 油箱2的总供油
Q2oilBoxV(:,5) = Q2oilBoxV(:,5) + Q2oilBoxV(:,6);  % 油箱6的总供油

