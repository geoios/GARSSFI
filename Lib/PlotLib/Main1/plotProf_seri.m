function plotProf_seri(ExtraProf,lineType,label)
%% ����˵��
%���ܣ���������
%���룺+profile ����
%      +lineType ����
%      +label ��ǩ
%% ���ܴ���
for i = 1:size(ExtraProf.svp,2)
    %svpInfo = [ExtraProf.depth ExtraProf.temp(:,i) ExtraProf.sal(:,i) repmat(ExtraProf.pos(2,i),size(ExtraProf.depth,1),1)];
    %svp = delGrosso(svpInfo);
    svp = ExtraProf.svp(:,i);
    %plot(svp(:,2),svp(:,1),lineType,'lineWidth',1.5);hold on
    plot(svp,ExtraProf.depth,lineType,'lineWidth',1.5);hold on
end
%�������ǩ
if(strcmp('�¶�����',label) ==1 )
    xlabel('\fontname{����}�¶�\fontname{Times New Roman}(\circC)');
elseif(strcmp('�ζ�����',label) ==1 )
    xlabel('\fontname{����}�ζ�\fontname{Times New Roman}(PSU)');
elseif(strcmp('��������',label) ==1 )    
    %xlabel('\fontname{����}����\fontname{Times New Roman}(m/s)');
end
%ylabel('\fontname{����}���\fontname{Times New Roman}(m)');
%��ʽ����
set(gca,'ydir','reverse'); 
set(gca,'FontSize',8,'Fontname','Times New Roman','FontWeight','bold','linewidth',0.75,'tickdir','in');%
set(gcf,'Units','centimeter','Position',[5 5 10 8]);
set(0,'defaultfigurecolor','w');


