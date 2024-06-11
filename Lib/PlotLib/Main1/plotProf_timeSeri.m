function plotProf_timeSeri(Svp,xAxisTime,label)
%% ����˵��
%���ܣ���������
%���룺+profile ����
%      +lineType ����
%      +label ��ǩ
%% ���ܴ���
dq=jet(size(Svp.data,2));
for iProf = 1:size(Svp.data,2)
    plot(Svp.data(:,iProf),Svp.depth(:,1),'-','lineWidth',0.75,'color',dq(iProf,:));hold on
end
%�������ǩ
if(strcmp('�¶�����',label) ==1 )
    xlabel('Temperature (\circC)');
elseif(strcmp('�ζ�����',label) ==1 )
    xlabel('Salinity (PSU)');
elseif(strcmp('��������',label) ==1 )    
    xlabel('���� (m/s)');% variations 
end
%xlim([-60 60]);
xlim([1450 1550]);
ylabel('��� (m)');
ylim([Svp.depth(1,1) 2000]);
%��ʽ����
set(gca,'FontSize',8,'Fontname','����','linewidth',0.5,'tickdir','in','ydir','reverse','FontWeight','bold');
set(gcf,'Units','centimeter','Position',[5 5 10 7]);
set(0,'defaultfigurecolor','w');
%colorbar
colormap jet
cb = colorbar;
set(get(cb,'title'),'string','ʱ��');
set(cb,'YTick',[0 0.5 1],'YTickLabel',{['20110328'] ['20151105'] ['20200615']}); %ɫ��ֵ��Χ����ʾ���
%set(cb,'YTickLabel',{[num2str(xAxisTime(1)) '0'] num2str((xAxisTime(end) + xAxisTime(1))/2) [num2str(xAxisTime(end)) '00']}) %����̶ȸ�ֵ
% box off
% ax2 = axes('Position',get(gca,'Position'),'XAxisLocation','top','YAxisLocation','right','Color','none','XColor','k','YColor','k','linewidth',0.5);
% set(ax2,'YTick', []);
% set(ax2,'XTick', []);
% box on