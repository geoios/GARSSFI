function plotInteSsp_compaAllStati(DiffProdInteSsp,start)
%% ����˵��
%���ܣ����Ʋ�ֵ����
%% ���ܴ���
statiSeri = DiffProdInteSsp.statiSeri;
JpnSvpInfo = DiffProdInteSsp.JpnSvpInfo;
InteProf_woa = DiffProdInteSsp.InteSsp_woa;
InteProf_en4 = DiffProdInteSsp.InteSsp_en4;
InteProf_phy = DiffProdInteSsp.InteSsp_phy;

count = start;
for iStatiSeri = 1:size(statiSeri,1)
    %Argo����
    subplot(14,20,count);
    count = start + iStatiSeri;
    plotProf_allProf([JpnSvpInfo.depth(:,iStatiSeri) JpnSvpInfo.sounVelo(:,iStatiSeri)],'k-','��������');hold on;%ʵ������
    plotProf_allProf(InteProf_woa{iStatiSeri},'g-','��������');%Argo����
    plotProf_allProf(InteProf_en4{iStatiSeri},'b-','��������');%Argo����
    plotProf_allProf(InteProf_phy{iStatiSeri},'r-','��������');%Argo����
    axis([1450 1540 0 2000]);
    if(mod(iStatiSeri,20) ~= 1)
        set(gca,'yticklabel',[]);
    end
    if(iStatiSeri<241)
        set(gca,'xticklabel',[]);
    end
    if(count == 122)
        pos = axis;
        ylabel('Depth (m)');%,'position',[1450 (pos(3)+pos(4))/2]
    end
    if(count == 271)
        pos = axis;
        xlabel('Sound Speed (m/s)','position',[(pos(1)+pos(2))/2 2750]);
    end
end
set(gcf,'Units','centimeter','Position',[0 0 30 20]);
set(gca,'FontSize',8,'Fontname', 'Arial','FontWeight','bold');%
set(0,'defaultfigurecolor','w');
legend('in-field SSP','WOA inte SSP','EN4 inte SSP','PHY inte SSP','FontSize',8,'box','on','position',[0.45 0.9 0.1 0.1],'Orientation','horizon')
