function plotPositError_enu(DiffProdPosi)
%% 函数说明
%功能：绘制定位误差
%% 功能代码
IniInfo = DiffProdPosi.InputData.IniInfo;
diffCentCoor_a = DiffProdPosi.diffCoor_munk;
diffCentCoor_b = DiffProdPosi.diffCoor_biline;
diffCentCoor_c = DiffProdPosi.diffCoor_essp;

for i = 1:size(DiffProdPosi.InputData.IniInfo,1)
    xAxisCoor(i,1) = IniInfo{i}.xAxisCoor;
end

plotError_posi([xAxisCoor diffCentCoor_a(:,2)],'go',0.5,45);hold on
plotError_posi([xAxisCoor diffCentCoor_b(:,2)],'bo',0.7,30);hold on
plotError_posi([xAxisCoor diffCentCoor_c(:,2)],'ro',0.9,15);
%ylim([min([diffCentCoor_cc(:,2);diffCentCoor_delay(:,2)])-0.05 max([diffCentCoor_cc(:,2);diffCentCoor_delay(:,2)])+0.05])
xlim([xAxisCoor(1,:)-0.5 xAxisCoor(end,1)+0.5])
set(gca,'FontSize',8,'Fontname','黑体');%,'FontWeight','bold'
box on
grid off
set(gcf,'Units','centimeter','Position',[5 5 20 15]);

