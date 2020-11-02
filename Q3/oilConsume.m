function sum = oilConsume(v)
% 求tBegin到tEnd时间内以速度v消耗的总油量
% 输出结构为(1,length(v)+1)，消耗1s后的结果保存在sum(2)中
sum = zeros(1,length(v)+1);  
for i = 1:length(v)
    sum(i+1) = sum(i) + v(i);
end