function plotProf_allProf(prof,lineType,label)
%% 函数说明
%功能：绘制剖面
%输入：+profile 剖面
%      +lineType 线型
%      +label 标签
%% 功能代码
plot(prof(:,2),prof(:,1),lineType,'lineWidth',1);
%横纵轴标签
if(strcmp('温度剖面',label) ==1 )
    xlabel('温度 (\circC)');
elseif(strcmp('盐度剖面',label) ==1 )
    xlabel('盐度 (PSU)');
elseif(strcmp('声速剖面',label) ==1 )    
    %xlabel('\fontname{Times New Roman}Sound Speed(m/s)');
end
%ylabel('\fontname{Times New Roman}Depth(m)');
%格式设置
set(gca,'ydir','reverse'); 
set(gca,'FontSize',8,'Fontname','黑体','linewidth',0.5,'tickdir','in','FontWeight','bold');%'FontWeight','bold',
%set(gcf,'Units','centimeter','Position',[5 5 9 8]);
set(0,'defaultfigurecolor','w');


