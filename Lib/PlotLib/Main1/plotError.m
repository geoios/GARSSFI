function plotError(dataMatr,lineType,alfa,sizePoin,sele)
%% ����˵��
%���ܣ����������
%���룺+dataMatr ����
%      +lineType ����
%�����*
%% ���ܴ���
% plot1 = plot(dataMatr(:,1),dataMatr(:,2),lineType,'linew',0.5,'markers',sizePoin,'lineWidth',lineWidth);
% plot1.Color(4) = alfa;
if(sele==1)
    scatter(dataMatr(:,1),dataMatr(:,2),sizePoin,'filled',lineType,'MarkerFaceAlpha',alfa,'MarkerEdgeAlpha',alfa,'LineWidth',1);%'filled',
elseif(sele==2)
    scatter(dataMatr(:,1),dataMatr(:,2),sizePoin,lineType,'MarkerFaceAlpha',alfa,'MarkerEdgeAlpha',alfa,'LineWidth',1);%'filled',
end
%��������
%legend('\fontname{Times New Roman}Weighted Mean Sound Selocity Profile','\fontname{Times New Roman}1st-level Optimized Profile','Location','North','Box','off');
%ylabel('\fontname{Times New Roman}Error(cm)');
%xlabel('\fontname{Times New Roman}(year)');

set(gca,'FontSize',8,'Fontname','Arial');%,'FontWeight','bold'
set(gca,'linewidth',0.75);
%set(gca,'tickdir','in');
%grid on;
set(gcf,'Units','centimeter','Position',[5 5 8 6]);
set(0,'defaultfigurecolor','w');
box on;
% set(gca,'xtick',[])
% set(gca,'ytick',[])

