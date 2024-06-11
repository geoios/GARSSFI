function plotProf_timeSeri(Svp,xAxisTime,label)
%% 函数说明
%功能：绘制剖面
%输入：+profile 剖面
%      +lineType 线型
%      +label 标签
%% 功能代码
dq=jet(size(Svp.data,2));
for iProf = 1:size(Svp.data,2)
    plot(Svp.data(:,iProf),Svp.depth(:,1),'-','lineWidth',0.75,'color',dq(iProf,:));hold on
end
%横纵轴标签
if(strcmp('温度剖面',label) ==1 )
    xlabel('Temperature (\circC)');
elseif(strcmp('盐度剖面',label) ==1 )
    xlabel('Salinity (PSU)');
elseif(strcmp('声速剖面',label) ==1 )    
    xlabel('声速 (m/s)');% variations 
end
%xlim([-60 60]);
xlim([1450 1550]);
ylabel('深度 (m)');
ylim([Svp.depth(1,1) 2000]);
%格式设置
set(gca,'FontSize',8,'Fontname','黑体','linewidth',0.5,'tickdir','in','ydir','reverse','FontWeight','bold');
set(gcf,'Units','centimeter','Position',[5 5 10 7]);
set(0,'defaultfigurecolor','w');
%colorbar
colormap jet
cb = colorbar;
set(get(cb,'title'),'string','时间');
set(cb,'YTick',[0 0.5 1],'YTickLabel',{['20110328'] ['20151105'] ['20200615']}); %色标值范围及显示间隔
%set(cb,'YTickLabel',{[num2str(xAxisTime(1)) '0'] num2str((xAxisTime(end) + xAxisTime(1))/2) [num2str(xAxisTime(end)) '00']}) %具体刻度赋值
% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on