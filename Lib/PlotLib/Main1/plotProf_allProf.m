function plotProf_allProf(prof,lineType,label)
%% ����˵��
%���ܣ���������
%���룺+profile ����
%      +lineType ����
%      +label ��ǩ
%% ���ܴ���
plot(prof(:,2),prof(:,1),lineType,'lineWidth',1);
%�������ǩ
if(strcmp('�¶�����',label) ==1 )
    xlabel('�¶� (\circC)');
elseif(strcmp('�ζ�����',label) ==1 )
    xlabel('�ζ� (PSU)');
elseif(strcmp('��������',label) ==1 )    
    %xlabel('\fontname{Times New Roman}Sound Speed(m/s)');
end
%ylabel('\fontname{Times New Roman}Depth(m)');
%��ʽ����
set(gca,'ydir','reverse'); 
set(gca,'FontSize',8,'Fontname','����','linewidth',0.5,'tickdir','in','FontWeight','bold');%'FontWeight','bold',
%set(gcf,'Units','centimeter','Position',[5 5 9 8]);
set(0,'defaultfigurecolor','w');


