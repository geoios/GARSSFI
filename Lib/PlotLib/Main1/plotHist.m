function plotHist(DataArray)
%% 函数说明
%功能：画直方图
%% 功能代码
% h = histfit(DataArray,10);
% %调色
% set(h(1),'facecolor',[57/255 121/255 242/255]);
% set(h(1),'edgecolor',[255/255 255/255 255/255]);
% set(h(2),'color',[228/255 57/255 46/255]);

[counts,centers] = hist(DataArray,10);
pic1 = bar([centers 2.5],[counts/sum(counts) 0],0.8);
set(pic1,'Facecolor',[57/255 121/255 242/255]);
set(pic1,'EdgeColor',[255/255 255/255 255/255]);
pos = axis;
ylabel('\fontname{Arial}Frequency','position',[centers(1)*0.94 (pos(3)+pos(4))/2]);

ylab = string(num2str(get(gca,'yTick')','%.2f'));
ylab(1) = '0';
set(gca,'yTickLabel',ylab);
set(gca,'xTickLabel',num2str(get(gca,'xTick')','%.1f'));
%整体格式
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');%,'FontWeight','bold'
set(gcf,'Units','centimeter','Position',[5 5 9 6]);
set(0,'defaultfigurecolor','w');
