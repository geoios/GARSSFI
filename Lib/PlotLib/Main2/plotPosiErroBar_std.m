function QuanAnalPosiErro = plotPosiErroBar_std(statName,StatInfo)
%% 函数说明
%功能：绘制定位误差直方图
%% 功能代码
%E方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,1)%E
for i = 1:size(statName,1)
    statsStd(i,:) = [StatInfo.statsPosiErroStd(i,1) StatInfo.statsPosiErroStd(i,1+3) StatInfo.statsPosiErroStd(i,1+2*3)];
end
a = categorical(cellstr(statName));
b = bar(a,statsStd);
set(b,'edgecolor','none');
maxValu = roundn(max(max(abs(statsStd)))*1.1,-3);
ylabel([{'E'},{''}],'position',[0 maxValu/2]);
ylim([0 maxValu])
set(gca, 'yTick', [0:maxValu:maxValu]);
set(gca,'YTickLabel',{'0',string(maxValu)})
legend('WOA18 SSP','EN4 SSP','GLORYS12 SSP','box','on','position',[0.45 0.92 0.1 0.1],'Orientation','horizon')
ylab = string(num2str(get(gca,'yTick')','%.2f'));
ylab(1,1) = '0';
set(gca,'yTickLabel',ylab);
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'

box off
ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.75);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on

QuanAnalPosiErro.stdMaxE = [getMaxValue(statsStd(:,1)) getMaxValue(statsStd(:,2)) getMaxValue(statsStd(:,3))];
QuanAnalPosiErro.stdMeanE = [mean(statsStd(:,1)) mean(statsStd(:,2)) mean(statsStd(:,3))];
QuanAnalPosiErro.stdSelfE = statsStd;
%N方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2)
for i = 1:size(statName,1)
    statsStd(i,:) = [StatInfo.statsPosiErroStd(i,2) StatInfo.statsPosiErroStd(i,2+3) StatInfo.statsPosiErroStd(i,2+2*3)];
end
a = categorical(cellstr(statName));
b = bar(a,statsStd);
set(b,'edgecolor','none');
maxValu = roundn(max(max(abs(statsStd)))*1.1,-3);
ylabel([{'N'},{'Error std (m/s)'}],'position',[0 maxValu/2]);
ylim([0 maxValu])
set(gca, 'yTick', [0:maxValu:maxValu]);
set(gca,'YTickLabel',{'0',string(maxValu)})
ylab = string(num2str(get(gca,'yTick')','%.2f'));
ylab(1,1) = '0';
set(gca,'yTickLabel',ylab);
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'

box off
ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.75);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on

set(gcf,'Units','centimeter','Position',[0 0 15 9]);
set(0,'defaultfigurecolor','w');

QuanAnalPosiErro.stdMaxN = [getMaxValue(statsStd(:,1)) getMaxValue(statsStd(:,2)) getMaxValue(statsStd(:,3))];
QuanAnalPosiErro.stdMeanN = [mean(statsStd(:,1)) mean(statsStd(:,2)) mean(statsStd(:,3))];
QuanAnalPosiErro.stdSelfN = statsStd;
%U方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3)
for i = 1:size(statName,1)
    statsStd(i,:) = [StatInfo.statsPosiErroStd(i,3) StatInfo.statsPosiErroStd(i,3+3) StatInfo.statsPosiErroStd(i,3+2*3)];
end
a = categorical(cellstr(statName));
b = bar(a,statsStd);
set(b,'edgecolor','none');
maxValu = roundn(max(max(abs(statsStd)))*1.1,-3);
ylabel([{'U'},{''}],'position',[0 maxValu/2]);
ylim([0 maxValu])
set(gca, 'yTick', [0:maxValu:maxValu]);
set(gca,'YTickLabel',{'0',string(maxValu)})
ylab = string(num2str(get(gca,'yTick')','%.2f'));
ylab(1,1) = '0';
set(gca,'yTickLabel',ylab);
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'

box off
ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.75);
set(ax2,'YTick', []);
set(ax2,'XTick', []);
box on

set(gcf,'Units','centimeter','Position',[0 0 15 9]);
set(0,'defaultfigurecolor','w');

QuanAnalPosiErro.stdMaxU = [getMaxValue(statsStd(:,1)) getMaxValue(statsStd(:,2)) getMaxValue(statsStd(:,3))];
QuanAnalPosiErro.stdMeanU = [mean(statsStd(:,1)) mean(statsStd(:,2)) mean(statsStd(:,3))];
QuanAnalPosiErro.stdSelfU = statsStd;