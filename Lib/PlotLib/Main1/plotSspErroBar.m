function [QuanAnalInteSsp] = plotSspErroBar(MeanRes,StdRes)
%% 函数说明
%功能：绘制声速剖面误差直方图
%% 功能代码
%均值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h1 = subplot(2,1,1)
for i = 1:3%4
    statsMean(i,:) = [abs(MeanRes.munk(i)) abs(MeanRes.biline(i)) abs(MeanRes.essp(i))];
end
a = categorical(cellstr({'10-800 m';'900-1727.80 m';'10-1727.80 m'}));%'900-500 m';
b = bar(a,statsMean);
b(1).FaceColor = [0.4660 0.6740 0.1880];
b(2).FaceColor = [0 0.4470 0.7410];
b(3).FaceColor = [0.8500 0.3250 0.0980];
set(b,'edgecolor','none');
ax = gca;ax.XAxis.TickLength = [0 0];
%maxValu = ceil(max(max(abs(statsMean))));
ylabel([{'均值绝对值 (m/s)'}],'position',[0.4 15/2]);
% ylim([0 maxValu])
% set(gca, 'yTick', [0:maxValu:maxValu]);
% set(gca,'YTickLabel',{'0',string(maxValu)})
ylim([0 15])
set(gca,'yTick',[0:5:15]);
% text(0.6,16,['(a)'],'FontSize',8,'FontWeight','bold');
%legend('WOA18','EN4','GLORYS12','box','on','position',[0.45 0.92 0.1 0.1],'Orientation','horizon')
legend('Munk模型反演SSP','双线性模型反演SSP','自构经验模型反演SSP','box','on','Location', 'northeast')
set(gca,'FontSize',8,'Fontname','黑体','linewidth',0.5,'tickdir','in');box on;%,'FontWeight','bold'

box off
ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on
%标准差%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h2 = subplot(2,1,2)
for i = 1:3
    statsStd(i,:) = [StdRes.munk(i) StdRes.biline(i) StdRes.essp(i)];
end
a = categorical(cellstr({'10-800 m';'900-1727.80 m';'10-1727.80 m'}));%'300-500 m';
b = bar(a,statsStd);
b(1).FaceColor = [0.4660 0.6740 0.1880];
b(2).FaceColor = [0 0.4470 0.7410];
b(3).FaceColor = [0.8500 0.3250 0.0980];
set(b,'edgecolor','none');
ax = gca;ax.XAxis.TickLength = [0 0];
%maxValu = ceil(max(max(abs(statsStd))));
ylabel([{'标准差 (m/s)'}],'position',[0.4 15/2]);
% ylim([0 maxValu])
% set(gca, 'yTick', [0:maxValu:maxValu]);
% set(gca,'YTickLabel',{'0',string(maxValu)})
ylim([0 15])
set(gca,'yTick',[0:5:15]);
set(gca,'FontSize',8,'Fontname','黑体','linewidth',0.5,'tickdir','in');box on;%,'FontWeight','bold'

box off
ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on

set(gcf,'Units','centimeter','Position',[0 0 12 8]);
set(0,'defaultfigurecolor','w');

