function [stats] = plotHist_svpError(diffProf)
%% ����˵��
%���ܣ������������ֱ��ͼ��ͼ

%% ���ܴ���
%������
[m,n] = size(diffProf);
hist = reshape(diffProf,[1,m*n]);%1��
%��ͼ
plotHist(hist);
% xlabel('\fontname{Arial}Sound Speed Error (m/s)');
% ylabel('\fontname{Arial}Frequency');
%set(gcf,'Units','centimeter','Position',[5 5 6 6/1.5]);
%set(gca,'FontSize',8);
%ͳ�Ʒ���
stats = [mean(hist') std(hist')];

