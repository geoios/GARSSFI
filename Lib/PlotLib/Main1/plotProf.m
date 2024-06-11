function plotProf(prof,lineType,label)
%% ����˵��
%���ܣ���������
%���룺+profile ����
%      +lineType ����
%      +label ��ǩ
%% ���ܴ���
plot(prof(:,2),prof(:,1),lineType,'lineWidth',0.75);
%�������ǩ
if(strcmp('�¶�����',label) ==1 )
    xlabel('�¶� (\circC)');
elseif(strcmp('�ζ�����',label) ==1 )
    xlabel('�ζ� (PSU)');
elseif(strcmp('��������',label) ==1 )
    xlabel('���� (m/s)');
end
ylabel('��� (m)');
%��ʽ����
set(gca,'ydir','reverse');
set(gca,'FontSize',8,'Fontname','����');%,'FontWeight','bold'
set(gca,'linewidth',0.5);
set(gca,'tickdir','in');
set(gcf,'Units','centimeter','Position',[5 5 9 7]);
set(0,'defaultfigurecolor','w');


