% 画四个主油箱的总的消耗速度
mainAll = zeros(7200,1);

mainAll(:) = Q3oilBoxV(:,2)+Q3oilBoxV(:,3)+Q3oilBoxV(:,4)+Q3oilBoxV(:,5);
figure(1)
plot(mainAll,'b-')
set(gca,'XTick',0:1000:7200);
xlabel('\it  t')
ylabel('\it kg/s')

set(gca,'linewidth',0.5,'fontsize',12,'fontname','Times');
hold on

legend("allMainBox")
set(gca,'linewidth',0.5,'fontsize',12,'fontname','Times');
xlabel("t")
ylabel("kg/s")
axis([0 7200 0 2.5])
% set(gca,'XTick',0:60:7200);
% set(gca,'YTick',0:0.5:2.5);