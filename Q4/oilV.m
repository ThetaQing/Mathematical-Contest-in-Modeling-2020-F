% g��������Ĺ�������

oil = zeros(100,4);
oilBoxV = zeros(7200,6);
num1 = 1;
num2 = 1;
% [a,b]=min(deltaMax(:));
oil(:,:) = method(1543,:,:);%%%%%%%Ҫ�ģ���Ϊb
% �Ѻ��ͷ���д�����
for j = 1:99
    num1 = oil(j,3);
    num2 = oil(j,4);
    if(oil(j,1) == 0)
        break;
    end
    oilBoxV(oil(j,1):(oil(j+1,1)-1),num1) = oil(j,2)*Q4haoyou(oil(j,1):oil(j+1,1)-1);
    oilBoxV(oil(j,1):oil(j+1,1)-1,num2) = (1-oil(j,2))*Q4haoyou(oil(j,1):oil(j+1,1)-1);

end
oilBoxV(:,2) = oilBoxV(:,2) + oilBoxV(:,1);  % ��������2�Ĺ���
oilBoxV(:,5) = oilBoxV(:,5) + oilBoxV(:,6);  % ��������6�Ĺ���


