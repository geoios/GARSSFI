function plotProf(prof,lineType,label)
%% 函数说明
%功能：绘制剖面
%输入：+profile 剖面
%      +lineType 线型
%      +label 标签
%% 功能代码
plot(prof(:,2),prof(:,1),lineType,'lineWidth',0.75);
%横纵轴标签
if(strcmp('温度剖面',label) ==1 )
    xlabel('温度 (\circC)');
elseif(strcmp('盐度剖面',label) ==1 )
    xlabel('盐度 (PSU)');
elseif(strcmp('声速剖面',label) ==1 )
    xlabel('声速 (m/s)');
end
ylabel('深度 (m)');
%格式设置
set(gca,'ydir','reverse');
set(gca,'FontSize',8,'Fontname','黑体');%,'FontWeight','bold'
set(gca,'linewidth',0.5);
set(gca,'tickdir','in');
set(gcf,'Units','centimeter','Position',[5 5 9 7]);
set(0,'defaultfigurecolor','w');


