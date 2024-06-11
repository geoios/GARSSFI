function plotExtrSsp(DiffProdInteSsp,prod)
%% 函数说明
%功能；绘制提取剖面的内插外推剖面
%% 功能代码
if(strcmp('WOA',prod))
    for j = 1:size(DiffProdInteSsp,1)
        figure
        for iStatiSeri = 1:size(DiffProdInteSsp{j}.statiSeri,1)
            %Argo剖面
            subplot(8,5,iStatiSeri);
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_afte.woa{iStatiSeri},'r-','声速剖面')
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_befo.woa{iStatiSeri},'b-','声速剖面')
            if(mod(iStatiSeri,5) ~= 1)
                set(gca,'yticklabel',[]);
            end
            set(gca,'xticklabel',[]);
        end
        set(gcf,'Units','centimeter','Position',[0 0 15 20]);
        set(gca,'FontSize',8,'Fontname','Arial','FontWeight','bold');
        set(0,'defaultfigurecolor','w');
        %print(gcf,'-djpeg','-r600',[expoFigPath 'woa搜索插值' num2str(j) '站']);
    end
elseif(strcmp('EN4',prod))
    for j = 1:size(DiffProdInteSsp,1)
        figure
        for iStatiSeri = 1:size(DiffProdInteSsp{j}.statiSeri,1)
            %Argo剖面
            subplot(8,5,iStatiSeri);
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_afte.en4{iStatiSeri},'r-','声速剖面')
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_befo.en4{iStatiSeri},'b-','声速剖面')
            if(mod(iStatiSeri,5) ~= 1)
                set(gca,'yticklabel',[]);
            end
            set(gca,'xticklabel',[]);
        end
        set(gcf,'Units','centimeter','Position',[0 0 15 20]);
        set(gca,'FontSize',8,'Fontname','Arial','FontWeight','bold');
        set(0,'defaultfigurecolor','w');
        %print(gcf,'-djpeg','-r600',[expoFigPath 'en4搜索插值' num2str(j) '站']);
    end
elseif(strcmp('PHY',prod))
    for j = 1:size(DiffProdInteSsp,1)
        figure
        for iStatiSeri = 1:size(DiffProdInteSsp{j}.statiSeri,1)
            %Argo剖面
            subplot(8,5,iStatiSeri);
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_afte.phy{iStatiSeri},'r-','声速剖面')
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_befo.phy{iStatiSeri},'b-','声速剖面')
            if(mod(iStatiSeri,5) ~= 1)
                set(gca,'yticklabel',[]);
            end
            set(gca,'xticklabel',[]);
        end
        set(gcf,'Units','centimeter','Position',[0 0 15 20]);
        set(gca,'FontSize',8,'Fontname','Arial','FontWeight','bold');
        set(0,'defaultfigurecolor','w');
        %print(gcf,'-djpeg','-r600',[expoFigPath 'phy搜索插值' num2str(j) '站']);
    end
else
    error('输入产品名称错误！');
end
