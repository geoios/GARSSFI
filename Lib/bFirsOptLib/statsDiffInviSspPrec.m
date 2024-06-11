function [meanRes,stdRes] = statsDiffSspPrec(diffSsp_woa)
%% 函数说明
%功能：统计精度
%% 功能代码
[m,n] = size(diffSsp_woa);
newDiffSsp_woa = reshape(diffSsp_woa,m*n,1);

meanRes = mean(newDiffSsp_woa);
stdRes = std(newDiffSsp_woa);
