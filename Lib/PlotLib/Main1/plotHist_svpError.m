function [stats] = plotHist_svpError(diffProf)
%% 函数说明
%功能：声速剖面误差直方图绘图

%% 功能代码
%向量化
[m,n] = size(diffProf);
hist = reshape(diffProf,[1,m*n]);%1行
%绘图
plotHist(hist);
% xlabel('\fontname{Arial}Sound Speed Error (m/s)');
% ylabel('\fontname{Arial}Frequency');
%set(gcf,'Units','centimeter','Position',[5 5 6 6/1.5]);
%set(gca,'FontSize',8);
%统计分析
stats = [mean(hist') std(hist')];

