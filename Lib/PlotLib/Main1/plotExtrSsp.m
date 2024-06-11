function plotExtrSsp(DiffProdInteSsp,prod)
%% ����˵��
%���ܣ�������ȡ������ڲ���������
%% ���ܴ���
if(strcmp('WOA',prod))
    for j = 1:size(DiffProdInteSsp,1)
        figure
        for iStatiSeri = 1:size(DiffProdInteSsp{j}.statiSeri,1)
            %Argo����
            subplot(8,5,iStatiSeri);
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_afte.woa{iStatiSeri},'r-','��������')
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_befo.woa{iStatiSeri},'b-','��������')
            if(mod(iStatiSeri,5) ~= 1)
                set(gca,'yticklabel',[]);
            end
            set(gca,'xticklabel',[]);
        end
        set(gcf,'Units','centimeter','Position',[0 0 15 20]);
        set(gca,'FontSize',8,'Fontname','Arial','FontWeight','bold');
        set(0,'defaultfigurecolor','w');
        %print(gcf,'-djpeg','-r600',[expoFigPath 'woa������ֵ' num2str(j) 'վ']);
    end
elseif(strcmp('EN4',prod))
    for j = 1:size(DiffProdInteSsp,1)
        figure
        for iStatiSeri = 1:size(DiffProdInteSsp{j}.statiSeri,1)
            %Argo����
            subplot(8,5,iStatiSeri);
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_afte.en4{iStatiSeri},'r-','��������')
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_befo.en4{iStatiSeri},'b-','��������')
            if(mod(iStatiSeri,5) ~= 1)
                set(gca,'yticklabel',[]);
            end
            set(gca,'xticklabel',[]);
        end
        set(gcf,'Units','centimeter','Position',[0 0 15 20]);
        set(gca,'FontSize',8,'Fontname','Arial','FontWeight','bold');
        set(0,'defaultfigurecolor','w');
        %print(gcf,'-djpeg','-r600',[expoFigPath 'en4������ֵ' num2str(j) 'վ']);
    end
elseif(strcmp('PHY',prod))
    for j = 1:size(DiffProdInteSsp,1)
        figure
        for iStatiSeri = 1:size(DiffProdInteSsp{j}.statiSeri,1)
            %Argo����
            subplot(8,5,iStatiSeri);
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_afte.phy{iStatiSeri},'r-','��������')
            plotProf_seri(DiffProdInteSsp{j}.TempoSvpData_befo.phy{iStatiSeri},'b-','��������')
            if(mod(iStatiSeri,5) ~= 1)
                set(gca,'yticklabel',[]);
            end
            set(gca,'xticklabel',[]);
        end
        set(gcf,'Units','centimeter','Position',[0 0 15 20]);
        set(gca,'FontSize',8,'Fontname','Arial','FontWeight','bold');
        set(0,'defaultfigurecolor','w');
        %print(gcf,'-djpeg','-r600',[expoFigPath 'phy������ֵ' num2str(j) 'վ']);
    end
else
    error('�����Ʒ���ƴ���');
end
