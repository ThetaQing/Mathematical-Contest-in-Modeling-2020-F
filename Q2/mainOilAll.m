% 画四个主油箱的总的消耗速度
load("haoyou.mat")
mainAll = zeros(7200,1);
mainAll(:) = Q2oilBoxV(:,2)+Q2oilBoxV(:,3)+Q2oilBoxV(:,4)+Q2oilBoxV(:,5);
plot(mainAll(:),'r.',"markersize",5)
hold on
plot(haoyou(:),"k:","markersize",10)
hold on
legend("4mainOilBox","idealOilConsume")
xlabel('\it  t')
ylabel('\it kg/s')
set(gca,'linewidth',0.5,'fontsize',12,'fontname','Times');
axis([0 7200 0 2.5])

% set(gca,'XTick',0:60:7200);
% set(gca,'YTick',0:0.5:2.5);