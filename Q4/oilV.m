% g各个油箱的供油曲线

oil = zeros(100,4);
oilBoxV = zeros(7200,6);
num1 = 1;
num2 = 1;
% [a,b]=min(deltaMax(:));
oil(:,:) = method(1543,:,:);%%%%%%%要改，改为b
% 把耗油方法写入表中
for j = 1:99
    num1 = oil(j,3);
    num2 = oil(j,4);
    if(oil(j,1) == 0)
        break;
    end
    oilBoxV(oil(j,1):(oil(j+1,1)-1),num1) = oil(j,2)*Q4haoyou(oil(j,1):oil(j+1,1)-1);
    oilBoxV(oil(j,1):oil(j+1,1)-1,num2) = (1-oil(j,2))*Q4haoyou(oil(j,1):oil(j+1,1)-1);

end
oilBoxV(:,2) = oilBoxV(:,2) + oilBoxV(:,1);  % 更正油箱2的供油
oilBoxV(:,5) = oilBoxV(:,5) + oilBoxV(:,6);  % 更正油箱6的供油


