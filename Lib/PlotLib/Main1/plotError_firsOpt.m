function plotError_firsOpt(diffCoor_argo,diffCoor_firsOpt_munk,diffCoor_firsOpt,JpnIniInfo,statiSeri)
%% 函数说明
%功能：绘定位误差图
%% 功能代码
h1 = subplot(3,1,1);
%plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_inField(:,1)],'bo',0.3,60,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_argo(:,1)],'go',0.5,45,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_firsOpt_munk(:,1)],'bo',0.7,30,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_firsOpt(:,1)],'ro',0.9,10,1);
set(gca,'xticklabel',[]);
pos = axis;
ylabel('{\itE} (m)','position',[2010.4 (pos(3)+pos(4))/2]);
%xlim([JpnIniInfo.xAxisCoor(1)-0.2 JpnIniInfo.xAxisCoor(end)+0.2]);
xlim([2011 2021])
%ylim([min(diffCoor_argo(:,1))-0.2 max(diffCoor_argo(:,1))+0.2])
ylim([-0.8 0.8])
set(gca,'yTick',[-0.8:0.4:0.8]);
legend('Munk SSP定位误差','Bilinear SSP定位误差','ESSP定位误差','Location','NorthOutSide','Box','on','position',[0.45 0.90 0.1 0.05],'Orientation','horizon');%
set(gca,'FontSize',8,'Fontname','黑体');%,'FontWeight','bold'

h2 = subplot(3,1,2);
%plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_inField(:,2)],'bo',0.3,60,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_argo(:,2)],'go',0.5,45,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_firsOpt_munk(:,2)],'bo',0.7,30,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_firsOpt(:,2)],'ro',0.9,10,1);
set(gca,'xticklabel',[]);
pos = axis;
ylabel('{\itN} (m)','position',[2010.4 (pos(3)+pos(4))/2]);
%xlim([JpnIniInfo.xAxisCoor(1)-0.2 JpnIniInfo.xAxisCoor(end)+0.2]);
xlim([2011 2021])
%ylim([min(diffCoor_argo(:,2))-0.2 max(diffCoor_argo(:,2))+0.2])
ylim([-3 3])
set(gca,'yTick',[-3:1.5:3]);
ylab = string(num2str(get(gca,'yTick')','%.1f'));
ylab(3,1) = '0';
set(gca,'yTickLabel',ylab);
set(gca,'FontSize',8,'Fontname','Arial');%,'FontWeight','bold'

h3 = subplot(3,1,3);
%plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_inField(:,3)],'bo',0.3,60,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_argo(:,3)],'go',0.5,45,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_firsOpt_munk(:,3)],'bo',0.7,30,1);hold on
plotError([JpnIniInfo.xAxisCoor(statiSeri',:) diffCoor_firsOpt(:,3)],'ro',0.9,10,1);
pos = axis;
ylabel('{\itU} (m)','position',[2010.4 (pos(3)+pos(4))/2]);
%xlim([JpnIniInfo.xAxisCoor(1)-0.2 JpnIniInfo.xAxisCoor(end)+0.2]);
xlim([2011 2021])
%ylim([min(diffCoor_argo(:,3))-4 max(diffCoor_argo(:,3))+4])
ylim([-40 40])
set(gca,'yTick',[-40:20:40]);
xlabel('Date','FontSize',8);
set(gca,'FontSize',8,'Fontname','Arial');%,'FontWeight','bold'
set(gcf,'Units','centimeter','Position',[5 5 15 12]);
box on;

%设置子图位置
set(h1,'position',[0.1 0.65 0.8 0.2])
set(h2,'position',[0.1 0.40 0.8 0.2])
set(h3,'position',[0.1 0.15 0.8 0.2])

