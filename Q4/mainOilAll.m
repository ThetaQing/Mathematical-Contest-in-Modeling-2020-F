% 画四个主油箱的总的消耗速度
figure(2)
load("Q4haoyou.mat")
load('Q4oilBoxV_200.mat')
mainAll = zeros(7200,1);
mainAll(:) = oilBoxV(:,2)+oilBoxV(:,3)+oilBoxV(:,4)+oilBoxV(:,5);
mg=sum(mainAll(:));
mg1=sum(Q4haoyou(:));
% for i=1:7200
%     if mainAll(i)<Q4haoyou(i)
%         mainAll(i)=Q4haoyou(i)-0.01;
%         
%     end
% end
% 
% plot(mainAll(:),'r.',"markersize",5)
% hold on
% plot(Q4haoyou(:),"k:","markersize",10)
% hold on
% legend("4mainOilBox","idealOilConsume")
% xlabel('\it  t')
% ylabel('\it kg/s')
% set(gca,'linewidth',0.5,'fontsize',12,'fontname','Times');
% axis([0 7200 0 2])

% set(gca,'XTick',0:60:7200);
% set(gca,'YTick',0:0.5:2.5);