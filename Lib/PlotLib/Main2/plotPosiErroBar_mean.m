function QuanAnalPosiErro = plotPosiErroBar_mean(statName,StatInfo)
%% 函数说明
%功能：绘制定位误差直方图
%% 功能代码
%E方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,1)%E
for i = 1%:size(statName,1)
    statsMean(i,:) = [StatInfo.statsPosiErroMean(i,1) StatInfo.statsPosiErroMean(i,1+3) StatInfo.statsPosiErroMean(i,1+2*3)];
end
a = categorical(cellstr(statName));
b = bar(a,statsMean);
set(b,'edgecolor','none');
maxValu = roundn(max(max(abs(statsMean)))*1.1,-3);
ylabel([{'E'},{''}],'position',[0 0]);
ylim([-maxValu maxValu])
set(gca, 'yTick', [-maxValu:maxValu:maxValu]);
set(gca,'YTickLabel',{string(-maxValu),'0',string(maxValu)})
legend('WOA18 SSP','EN4 SSP','GLORYS12 SSP','box','on','position',[0.45 0.92 0.1 0.1],'Orientation','horizon')
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'

box off
ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.75);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on

QuanAnalPosiErro.meanMaxE = [getMaxValue(statsMean(:,1)) getMaxValue(statsMean(:,2)) getMaxValue(statsMean(:,3))];
QuanAnalPosiErro.meanMeanE = [mean(statsMean(:,1)) mean(statsMean(:,2)) mean(statsMean(:,3))];
QuanAnalPosiErro.meanSelfE = statsMean;
%N方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2)
for i = 1:size(statName,1)
    statsMean(i,:) = [StatInfo.statsPosiErroMean(i,2) StatInfo.statsPosiErroMean(i,2+3) StatInfo.statsPosiErroMean(i,2+2*3)];
end
a = categorical(cellstr(statName));
b = bar(a,statsMean);
set(b,'edgecolor','none');
maxValu = roundn(max(max(abs(statsMean)))*1.1,-3);
ylabel([{'N'},{'Error mean (m/s)'}],'position',[0 0]);
ylim([-maxValu maxValu])
set(gca, 'yTick', [-maxValu:maxValu:maxValu]);
set(gca,'YTickLabel',{string(-maxValu),'0',string(maxValu)})
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'

box off
ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.75);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on

QuanAnalPosiErro.meanMaxN = [getMaxValue(statsMean(:,1)) getMaxValue(statsMean(:,2)) getMaxValue(statsMean(:,3))];
QuanAnalPosiErro.meanMeanN = [mean(statsMean(:,1)) mean(statsMean(:,2)) mean(statsMean(:,3))];
QuanAnalPosiErro.meanSelfN = statsMean;
%U方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3)
for i = 1:size(statName,1)
    statsMean(i,:) = [StatInfo.statsPosiErroMean(i,3) StatInfo.statsPosiErroMean(i,3+3) StatInfo.statsPosiErroMean(i,3+2*3)];
end
a = categorical(cellstr(statName));
b = bar(a,statsMean);
set(b,'edgecolor','none');
maxValu = roundn(max(max(abs(statsMean)))*1.1,-3);
ylabel([{'U'},{''}],'position',[0 0]);
ylim([-maxValu maxValu])
set(gca, 'yTick', [-maxValu:maxValu:maxValu]);
set(gca,'YTickLabel',{string(-maxValu),'0',string(maxValu)})
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'

box off
ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.75);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on

QuanAnalPosiErro.meanMaxU = [getMaxValue(statsMean(:,1)) getMaxValue(statsMean(:,2)) getMaxValue(statsMean(:,3))];
QuanAnalPosiErro.meanMeanU = [mean(statsMean(:,1)) mean(statsMean(:,2)) mean(statsMean(:,3))];
QuanAnalPosiErro.meanSelfU = statsMean;

set(gcf,'Units','centimeter','Position',[0 0 15 9]);
set(0,'defaultfigurecolor','w');

