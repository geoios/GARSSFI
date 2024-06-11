function plotSspErroStats(DiffSsp)
%% 函数说明
%功能：
%% 功能代码
histogram(DiffSsp.munk,100,'FaceColor','g', 'EdgeColor','g','FaceAlpha',0.3);hold on;
histogram(DiffSsp.biline,100,'FaceColor','b', 'EdgeColor','b','FaceAlpha',0.3);hold on
histogram(DiffSsp.essp,100,'FaceColor','r', 'EdgeColor','r','FaceAlpha',0.3);
legend('Munk模型','双线性模型','指数型模型','box','off','FontSize',8);
xlabel('声速误差 (m/s)');
xlim([-100 100]);
ylabel('频率');
%参数设置
set(gca,'FontSize',8,...
        'Fontname','黑体',...
        'linewidth',0.75,...
        'FontWeight','bold',...
        'tickdir','in');
set(gcf,'Units','centimeter','Position',[10 10 10 8]);
set(0,'defaultfigurecolor','w');

