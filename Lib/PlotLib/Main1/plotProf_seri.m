function plotProf_seri(ExtraProf,lineType,label)
%% 函数说明
%功能：绘制剖面
%输入：+profile 剖面
%      +lineType 线型
%      +label 标签
%% 功能代码
for i = 1:size(ExtraProf.svp,2)
    %svpInfo = [ExtraProf.depth ExtraProf.temp(:,i) ExtraProf.sal(:,i) repmat(ExtraProf.pos(2,i),size(ExtraProf.depth,1),1)];
    %svp = delGrosso(svpInfo);
    svp = ExtraProf.svp(:,i);
    %plot(svp(:,2),svp(:,1),lineType,'lineWidth',1.5);hold on
    plot(svp,ExtraProf.depth,lineType,'lineWidth',1.5);hold on
end
%横纵轴标签
if(strcmp('温度剖面',label) ==1 )
    xlabel('\fontname{宋体}温度\fontname{Times New Roman}(\circC)');
elseif(strcmp('盐度剖面',label) ==1 )
    xlabel('\fontname{宋体}盐度\fontname{Times New Roman}(PSU)');
elseif(strcmp('声速剖面',label) ==1 )    
    %xlabel('\fontname{宋体}声速\fontname{Times New Roman}(m/s)');
end
%ylabel('\fontname{宋体}深度\fontname{Times New Roman}(m)');
%格式设置
set(gca,'ydir','reverse'); 
set(gca,'FontSize',8,'Fontname','Times New Roman','FontWeight','bold','linewidth',0.75,'tickdir','in');%
set(gcf,'Units','centimeter','Position',[5 5 10 8]);
set(0,'defaultfigurecolor','w');


