% »­6¸öÓÍÏäµÄµ¥¶À
for i = 1:6
    figure(i)
    plot(Q2oilBoxV(:,i));
    hold on
    xlabel('\it  t')
    ylabel('\it kg/s')
    set(gca,'linewidth',0.5,'fontsize',12,'fontname','Times');
    set(gca,'XTick',0:1000:7200);
  
end
