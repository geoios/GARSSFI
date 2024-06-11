function plotInteSsp_compa(InveSvp,RayTracPosiResu)
%% ����˵��
%���ܣ����Ʋ�ֵ����
%% ���ܴ���
statiSeri = (1:size(RayTracPosiResu.RayTracPosiResu_infield,1))';
JpnSvpInfo = RayTracPosiResu.InputData.SvpInfo;
InteSsp_munk = InveSvp.InveSvp_munk;
InteSsp_biline = InveSvp.InveSvp_biline;
InteSsp_essp = InveSvp.InveSvp_essp;

line = ceil(size(statiSeri,1)/5);
for iStatiSeri = 1:size(statiSeri,1)
    obsTime = RayTracPosiResu.InputData.IniInfo{iStatiSeri}.gridTime;
    subplot(line,5,iStatiSeri);
    plotProf_allProf(JpnSvpInfo{iStatiSeri},'k-','��������');hold on;%ʵ������
	if(~isempty(InteSsp_munk{iStatiSeri}))
        plotProf_allProf(InteSsp_munk{iStatiSeri}(2:end,:),'g-','��������');%Argo����
    end
    if(~isempty(InteSsp_biline{iStatiSeri}))
        plotProf_allProf(InteSsp_biline{iStatiSeri}(2:end,:),'b-','��������');%Argo����
    end
    if(~isempty(InteSsp_essp{iStatiSeri}))
        plotProf_allProf(InteSsp_essp{iStatiSeri}(2:end,:),'r-','��������');%Argo����
    end
    axis([1450 1550 0 2000]);
    TextTime.year = num2str(obsTime(1,1));
    if(obsTime(1,2) < 10)%ͳһ���ڱ�ע
        TextTime.month = ['0' num2str(obsTime(1,2))];
    else
        TextTime.month = [num2str(obsTime(1,2))];
    end
	if(obsTime(1,3) < 10)
        TextTime.day = ['0' num2str(obsTime(1,3))];
    else
        TextTime.day = [num2str(obsTime(1,3))];
    end
	text(1500,1500,[TextTime.year ' '; TextTime.month '/' TextTime.day],'FontSize',8);%text(1460,-300,[TextTime.year '-' TextTime.month '-' TextTime.day],'FontSize',8);
    if(mod(iStatiSeri,5) ~= 1)%ͳһy���ע
        set(gca,'yticklabel',[]);
    end
    if(iStatiSeri<(line-1)*5+1)
        set(gca,'xticklabel',[]);
    end
    if(iStatiSeri == 16)
        pos = axis;
        ylabel('��� (m)','position',[1405 (pos(3)+pos(4))/2]);
    end
    if(iStatiSeri == line*5-2)%x���ע
        pos = axis;
        xlabel('���� (m/s)','position',[(pos(1)+pos(2))/2 2750]);
    elseif(iStatiSeri == (line-1)*5-2)
        if(size(statiSeri,1) < line*5-2)
            pos = axis;
            xlabel('���� (m/s)','position',[(pos(1)+pos(2))/2 5300]);
        end
    end
end

legend('ʵ��SSP','Munkģ�ͷ���SSP','˫����ģ�ͷ���SSP','ָ����ģ�ͷ���SSP','FontSize',8,'box','on','position',[0.45 0.90 0.1 0.1],'Orientation','horizon')
set(gcf,'Units','centimeter','Position',[0 0 14.65 16]);
set(gca,'FontSize',8,'Fontname','����','FontWeight','bold');%
set(0,'defaultfigurecolor','w');