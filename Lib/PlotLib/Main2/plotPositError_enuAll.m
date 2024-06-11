function plotPositError_enuAll(DiffProdPosi,type)
%% 函数说明
%功能：
%% 功能代码
%E方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,1);
plotPositError_enuAllE(DiffProdPosi);
xlim([2011 2021]);
xtickangle(30);
set(gca,'xTick',[2011:2:2021]);
set(gca,'xticklabel',[]);

maxValu = roundn(max(abs([DiffProdPosi.diffCoor_munk(:,1);DiffProdPosi.diffCoor_biline(:,1);DiffProdPosi.diffCoor_essp(:,1)]))*1.3,-3)*1.1;
ylim([-maxValu maxValu]);
set(gca,'yTick',[-maxValu:maxValu:maxValu]);
ylab = string(num2str(get(gca,'yTick')','%.3f'));
ylab(2,1) = '0';
set(gca,'yTickLabel',ylab);

legend('Munk模型反演SSP','双线性模型反演SSP','自构经验模型反演SSP','FontSize',8,'box','on','position',[0.45 0.91 0.1 0.1],'Orientation','horizon');

text(2011.2,maxValu*0.8,['E'],'FontSize',8,'FontWeight','bold');
set(gca,'FontSize',8,'Fontname','黑体');

% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on
%N方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2);
plotPositError_enuAllN(DiffProdPosi);
xlim([2011 2021]);
xtickangle(30);
set(gca,'xTick',[2011:2:2021]);
set(gca,'xticklabel',[]);

maxValu = roundn(max(abs([DiffProdPosi.diffCoor_munk(:,2);DiffProdPosi.diffCoor_biline(:,2);DiffProdPosi.diffCoor_essp(:,2)]))*1.3,-3)*1.1;
ylim([-maxValu maxValu]);
set(gca,'yTick',[-maxValu:maxValu:maxValu]);
ylab = string(num2str(get(gca,'yTick')','%.3f'));
ylab(2,1) = '0';
set(gca,'yTickLabel',ylab);

text(2011.2,maxValu*0.8,['N'],'FontSize',8,'FontWeight','bold');
    pos = axis;
    if(strcmp(type,'声速剖面解'))
        ylabel([{'声线跟踪解的定位误差 (m)'}],'position',[2009.9 (pos(3)+pos(4))/2]);
    elseif(strcmp(type,'声速剖面补偿解'))
        ylabel([{'声速剖面补偿解的定位误差 (m)'}],'position',[2009.9 (pos(3)+pos(4))/2]);
    elseif(strcmp(type,'海底阵列约束解'))
        ylabel([{'Positioning errors of the S3 positioning model (m)'}],'position',[2008.2 (pos(3)+pos(4))/2]);
    end
set(gca,'FontSize',8,'Fontname','黑体');

% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on
%U方向%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3);
plotPositError_enuAllU(DiffProdPosi);
xlabel('日期 (年)');
xtickangle(30);
xlim([2011 2021]);
set(gca,'xTick',[2011:2:2021]);

maxValu = roundn(max(abs([DiffProdPosi.diffCoor_munk(:,3);DiffProdPosi.diffCoor_biline(:,3);DiffProdPosi.diffCoor_essp(:,3)]))*1.3,-3)*1.1;
ylim([-maxValu maxValu]);
set(gca,'yTick',[-maxValu:maxValu:maxValu]);
ylab = string(num2str(get(gca,'yTick')','%.3f'));
ylab(2,1) = '0';
set(gca,'yTickLabel',ylab);

text(2011.2,maxValu*0.8,['U'],'FontSize',8,'FontWeight','bold');
set(gca,'FontSize',8,'Fontname','黑体');

% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on
%图幅大小%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gcf,'Units','centimeter','Position',[5 5 12 12]);
