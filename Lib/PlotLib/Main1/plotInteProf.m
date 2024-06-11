function plotInteProf(statiSeri,Svp,JpnSvpInfo)
%% 函数说明
%功能：绘制插值剖面
%% 功能代码
for iStatiSeri = 1:size(statiSeri,1)
    %Argo剖面
    svp = Svp{iStatiSeri};
    subplot(7,5,iStatiSeri);
    plotProf_allProf([JpnSvpInfo.depth(:,iStatiSeri) JpnSvpInfo.sounVelo(:,iStatiSeri)],'b-','声速剖面');hold on;%实测剖面
    plotProf_allProf(svp,'r-','声速剖面');%Argo剖面
    axis([1450 1540 0 2000]);
    if(mod(iStatiSeri,5) ~= 1)
        set(gca,'yticklabel',[]);
    end
    if(iStatiSeri<31)
        set(gca,'xticklabel',[]);
    end
    if(iStatiSeri == 16)
        pos = axis;
        ylabel('\fontname{Arial}Depth (m)','FontSize',8,'position',[1410 (pos(3)+pos(4))/2]);
    end
    if(iStatiSeri == 33)
        pos = axis;
        xlabel('\fontname{Arial}Sound Speed (m/s)','FontSize',8,'position',[(pos(1)+pos(2))/2 2750]);
    end
end
set(gcf,'Units','centimeter','Position',[0 0 15 15]);
set(gca,'FontSize',8,'Fontname', 'Arial','FontWeight','bold');%
set(0,'defaultfigurecolor','w');
legend('\fontname{Arial}in-field SSP','\fontname{Arial}inte SSP','FontSize',8,'box','on','position',[0.45 0.9 0.1 0.1],'Orientation','horizon')
