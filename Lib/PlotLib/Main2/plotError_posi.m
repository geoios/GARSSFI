function plotError(dataMatr,lineType,alfa,size)
%% ����˵��
%���ܣ����������
%���룺+dataMatr ����
%      +lineType ����
%�����*
%% ���ܴ���
%plot(dataMatr(:,1),dataMatr(:,2),lineType,'lineWidth',1.5);
scatter(dataMatr(:,1),dataMatr(:,2),size,lineType,'filled','MarkerFaceAlpha',alfa,'MarkerEdgeAlpha',alfa);%
%��������
%legend('\fontname{Times New Roman}Weighted Mean Sound Selocity Profile','\fontname{Times New Roman}1st-level Optimized Profile','Location','North','Box','off');
%ylabel('\fontname{Times New Roman}Error(cm)');
%xlabel('\fontname{Times New Roman}(year)');

set(gca,'FontSize',8,'Fontname', 'Arial');%,'FontWeight','bold'
%set(gca,'linewidth',0.5);
set(gca,'tickdir','in');
grid on;
set(gcf,'Units','centimeter','Position',[5 5 8 6]);
set(0,'defaultfigurecolor','w');
xlim([dataMatr(1,1)-0.2 dataMatr(end,1)+0.2])

