function plotSspErroStats(DiffSsp)
%% ����˵��
%���ܣ�
%% ���ܴ���
histogram(DiffSsp.munk,100,'FaceColor','g', 'EdgeColor','g','FaceAlpha',0.3);hold on;
histogram(DiffSsp.biline,100,'FaceColor','b', 'EdgeColor','b','FaceAlpha',0.3);hold on
histogram(DiffSsp.essp,100,'FaceColor','r', 'EdgeColor','r','FaceAlpha',0.3);
legend('Munkģ��','˫����ģ��','ָ����ģ��','box','off','FontSize',8);
xlabel('������� (m/s)');
xlim([-100 100]);
ylabel('Ƶ��');
%��������
set(gca,'FontSize',8,...
        'Fontname','����',...
        'linewidth',0.75,...
        'FontWeight','bold',...
        'tickdir','in');
set(gcf,'Units','centimeter','Position',[10 10 10 8]);
set(0,'defaultfigurecolor','w');

