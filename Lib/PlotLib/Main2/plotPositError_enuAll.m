function plotPositError_enuAll(DiffProdPosi,type)
%% ����˵��
%���ܣ�
%% ���ܴ���
%E����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

legend('Munkģ�ͷ���SSP','˫����ģ�ͷ���SSP','�Թ�����ģ�ͷ���SSP','FontSize',8,'box','on','position',[0.45 0.91 0.1 0.1],'Orientation','horizon');

text(2011.2,maxValu*0.8,['E'],'FontSize',8,'FontWeight','bold');
set(gca,'FontSize',8,'Fontname','����');

% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on
%N����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    if(strcmp(type,'���������'))
        ylabel([{'���߸��ٽ�Ķ�λ��� (m)'}],'position',[2009.9 (pos(3)+pos(4))/2]);
    elseif(strcmp(type,'�������油����'))
        ylabel([{'�������油����Ķ�λ��� (m)'}],'position',[2009.9 (pos(3)+pos(4))/2]);
    elseif(strcmp(type,'��������Լ����'))
        ylabel([{'Positioning errors of the S3 positioning model (m)'}],'position',[2008.2 (pos(3)+pos(4))/2]);
    end
set(gca,'FontSize',8,'Fontname','����');

% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on
%U����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3);
plotPositError_enuAllU(DiffProdPosi);
xlabel('���� (��)');
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
set(gca,'FontSize',8,'Fontname','����');

% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on
%ͼ����С%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gcf,'Units','centimeter','Position',[5 5 12 12]);
