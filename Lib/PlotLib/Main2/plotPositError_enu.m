function plotPositError_enu(DiffProdPosi)
%% 函数说明
%功能：绘制定位误差
%% 功能代码
statiSeri = (1:35)';
JpnIniInfo = DiffProdPosi.InputData.IniInfo;
diffCentCoor_a = DiffProdPosi.diffCoor_munk;
diffCentCoor_b = DiffProdPosi.diffCoor_biline;
diffCentCoor_c = DiffProdPosi.diffCoor_essp;

for i = 1:size(DiffProdPosi.InputData.IniInfo,1)
    xAxisCoor(i,1) = JpnIniInfo{i}.xAxisCoor;
end

h1 = subplot(3,1,1);
plotError_posi([xAxisCoor diffCentCoor_a(:,1)],'go',0.5,45);hold on
plotError_posi([xAxisCoor diffCentCoor_b(:,1)],'bo',0.7,30);hold on
plotError_posi([xAxisCoor diffCentCoor_c(:,1)],'ro',0.9,15);
set(gca,'xticklabel',[]);
pos = axis;
ylabel('E (m)','FontSize',8,'position',[2010.2 0]);%(pos(3)+pos(4))/2
maxValu = roundn(max(abs([diffCentCoor_a(:,1);diffCentCoor_b(:,1);diffCentCoor_c(:,1)]))*1.3,-3)*1.3;
ylim([-maxValu maxValu]);
set(gca,'yTick',[-maxValu:maxValu:maxValu]);
ylab = string(num2str(get(gca,'yTick')','%.3f'));
ylab(2,1) = '0';
set(gca,'yTickLabel',ylab);
legend('Munk模型','双线性模型','指数型模型','FontSize',8,'Location','NorthOutSide','Box','on','position',[0.45 0.89 0.1 0.05],'Orientation','horizon');
set(gca,'FontSize',8,'Fontname','黑体','FontWeight','bold');%,'FontWeight','bold'
box on
grid off

h2 = subplot(3,1,2);
plotError_posi([xAxisCoor diffCentCoor_a(:,2)],'go',0.5,45);hold on
plotError_posi([xAxisCoor diffCentCoor_b(:,2)],'bo',0.7,30);hold on
plotError_posi([xAxisCoor diffCentCoor_c(:,2)],'ro',0.9,15);
set(gca,'xticklabel',[]);
pos = axis;
ylabel('N (m)','FontSize',8,'position',[2010.2 0]);%(pos(3)+pos(4))/2
maxValu = roundn(max(abs([diffCentCoor_a(:,2);diffCentCoor_b(:,2);diffCentCoor_c(:,2)]))*1.3,-3)*1.3;
ylim([-maxValu maxValu]);
set(gca,'yTick',[-maxValu:maxValu:maxValu]);
ylab = string(num2str(get(gca,'yTick')','%.3f'));
ylab(2,1) = '0';
set(gca,'yTickLabel',ylab);
set(gca,'FontSize',8,'Fontname','黑体','FontWeight','bold');%,'FontWeight','bold'
box on
grid off

h3 = subplot(3,1,3);
plotError_posi([xAxisCoor diffCentCoor_a(:,3)],'go',0.5,45);hold on
plotError_posi([xAxisCoor diffCentCoor_b(:,3)],'bo',0.7,30);hold on
plotError_posi([xAxisCoor diffCentCoor_c(:,3)],'ro',0.9,15);
pos = axis;
ylabel('U (m)','FontSize',8,'position',[2010.2 0]);%(pos(3)+pos(4))/2
maxValu = roundn(max(abs([diffCentCoor_a(:,3);diffCentCoor_b(:,3);diffCentCoor_c(:,3)]))*1.3,-3)*1.3;
ylim([-maxValu maxValu]);
set(gca,'yTick',[-maxValu:maxValu:maxValu]);
ylab = string(num2str(get(gca,'yTick')','%.3f'));
ylab(2,1) = '0';
set(gca,'yTickLabel',ylab);
xlabel('时间 (year)','FontSize',8);
set(gca,'FontSize',8,'Fontname','黑体','FontWeight','bold');%,'FontWeight','bold'
set(gcf,'Units','centimeter','Position',[5 5 14.65 10]);
box on
grid off

%设置子图位置
set(h1,'position',[0.1 0.65 0.8 0.2])
set(h2,'position',[0.1 0.40 0.8 0.2])
set(h3,'position',[0.1 0.15 0.8 0.2])

