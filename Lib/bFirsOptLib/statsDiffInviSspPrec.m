function [meanRes,stdRes] = statsDiffSspPrec(diffSsp_woa)
%% ����˵��
%���ܣ�ͳ�ƾ���
%% ���ܴ���
[m,n] = size(diffSsp_woa);
newDiffSsp_woa = reshape(diffSsp_woa,m*n,1);

meanRes = mean(newDiffSsp_woa);
stdRes = std(newDiffSsp_woa);
