% ���ݸ����Ĳ��Ի�ȡ��������Ĺ�������
oil = zeros(100,4);
Q3oilBoxV = zeros(7200,6);
num1 = 1;
num2 = 1;
oil(:,:) = Q3method(2,:,:);
% �Ѻ��ͷ���д�����
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
Q3oilBoxV(:,2) = Q3oilBoxV(:,2) + Q3oilBoxV(:,1);  % ��������2�Ĺ���
Q3oilBoxV(:,5) = Q3oilBoxV(:,5) + Q3oilBoxV(:,6);  % ��������6�Ĺ���

