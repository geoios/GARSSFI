function plotInveCompa(InveSvp_cons,JpnSvpInfo,iStati)
%% ����˵��
%���ܣ�
%% ���ܴ���
plotProf([JpnSvpInfo.depth(2:end,1) JpnSvpInfo.sounVelo(2:end,iStati)],'k-','��������');hold on;
plotProf(InveSvp_cons.InveSvp_m1{iStati}(2:end,:),'g-','��������');hold on;
plotProf(InveSvp_cons.InveSvp_m2{iStati}(2:end,:),'b-','��������');hold on;
plotProf(InveSvp_cons.InveSvp_m3{iStati}(2:end,:),'r-','��������');
ylim([0 2000])
legend('ʵ��SSP','��Լ������SSP','�����Լ������SSP','�������б��Լ������SSP','location','east','box','off')
%�޸Ŀ̶�
% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on
