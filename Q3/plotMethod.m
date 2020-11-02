for i = 1:6
    figure(i)
    plot(Q3oilBoxV(:,i));
    hold on
    
    set(gca,'XTick',0:1000:7200);
    xlabel('\it  t')
    ylabel('\it kg/s')
    
    set(gca,'linewidth',0.5,'fontsize',12,'fontname','Times');
end
