function plotInveCompa(InveSvp_cons,JpnSvpInfo,iStati)
%% 函数说明
%功能：
%% 功能代码
plotProf([JpnSvpInfo.depth(2:end,1) JpnSvpInfo.sounVelo(2:end,iStati)],'k-','声速剖面');hold on;
plotProf(InveSvp_cons.InveSvp_m1{iStati}(2:end,:),'g-','声速剖面');hold on;
plotProf(InveSvp_cons.InveSvp_m2{iStati}(2:end,:),'b-','声速剖面');hold on;
plotProf(InveSvp_cons.InveSvp_m3{iStati}(2:end,:),'r-','声速剖面');
ylim([0 2000])
legend('实测SSP','无约束反演SSP','深海声速约束反演SSP','深海声速与斜率约束反演SSP','location','east','box','off')
%修改刻度
% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on
