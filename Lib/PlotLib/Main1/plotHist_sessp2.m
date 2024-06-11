function [StatsInfo_profError_munk,StatsInfo_profError] = plotHist_sessp(diffProf_munk,diffProf)
%% 函数说明
%功能：绘自构声速剖面精度直方图及输出精度
%% 功能代码
%绘0~1727.80误差直方图
[StatsInfo_profError_all_munk] = plotHist_svpError(diffProf_munk);
[StatsInfo_profError_all] = plotHist_svpError(diffProf);

%绘0~300误差直方图
subplot(1,3,1)
[StatsInfo_profError_surface_munk,y_surface_munk,x_surface_munk] = plotHist_svpError2(diffProf_munk(1:23,:));hold on;
[StatsInfo_profError_surface,y_surface,x_surface] = plotHist_svpError2(diffProf(1:23,:));
b = bar(x_surface_munk,y_surface_munk,0.8,'EdgeColor',[255/255 255/255 255/255]);hold on;
set(b,'edgecolor','none');
b = bar(x_surface,y_surface,0.5,'EdgeColor',[255/255 255/255 255/255]);
set(b,'edgecolor','none');
xlabel([{''};{'{\bfa} 0-300 m error distribution'}]);
ylabel([{'Frequency'}]);
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'
set(gca, 'xTick', [-55:55:55]);
set(gca,'XTickLabel',{'-55','0','50'})
xlim([-55 55])
%绘300~500误差直方图
subplot(1,3,2)
[StatsInfo_profError_middle_munk,y_middle_munk,x_middle_munk] = plotHist_svpError2(diffProf_munk(23:27,:));hold on;
[StatsInfo_profError_middle,y_middle,x_middle] = plotHist_svpError2(diffProf(23:27,:));
b = bar([x_middle_munk],[y_middle_munk],0.8,'EdgeColor',[255/255 255/255 255/255]);hold on;
set(b,'edgecolor','none');
b = bar(x_middle,y_middle,0.5,'EdgeColor',[255/255 255/255 255/255]);
set(b,'edgecolor','none');
pos = axis;
xlabel([{'Sound speed error (m/s)'};{'{\bfb} 300-500 m error distribution'}])
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'
legend('Bilinear SSP inversion results','Proposed ESSP inversion results','box','on','position',[0.47 0.92 0.1 0.1],'Orientation','horizon')
xlim([-15 15])
set(gca, 'xTick', [-15:15:15]);
%绘500~1727.80误差直方图
subplot(1,3,3)
[StatsInfo_profError_bottom_munk,y_bottom_munk,x_bottom_munk] = plotHist_svpError2(diffProf_munk(27:end,:));hold on;
[StatsInfo_profError_bottom,y_bottom,x_bottom] = plotHist_svpError2(diffProf(27:end,:));
b = bar(x_bottom_munk,y_bottom_munk,0.8,'EdgeColor',[255/255 255/255 255/255]);hold on;
set(b,'edgecolor','none');
b = bar(x_bottom,y_bottom,0.5,'EdgeColor',[255/255 255/255 255/255]);
set(b,'edgecolor','none');
xlabel([{''};{'{\bfc} 500-1727.80 m error distribution'}]);
set(gca,'FontSize',8,'Fontname','Arial','linewidth',0.75,'tickdir','in');box on;%,'FontWeight','bold'
xlim([-15 15])
set(gca, 'xTick', [-15:15:15]);

set(gcf,'Units','centimeter','Position',[5 5 20 7]);

StatsInfo_profError_munk = [StatsInfo_profError_all_munk;StatsInfo_profError_surface_munk;StatsInfo_profError_middle_munk;StatsInfo_profError_bottom_munk];
StatsInfo_profError = [StatsInfo_profError_all;StatsInfo_profError_surface;StatsInfo_profError_middle;StatsInfo_profError_bottom];
