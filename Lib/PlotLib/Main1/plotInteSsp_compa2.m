function plotInteSsp_compa2(DiffSsp,RayTracPosiResu)
%% 函数说明
%功能：绘制插值剖面
%% 功能代码
statiSeri = (1:size(RayTracPosiResu.RayTracPosiResu_infield,1))';
depth = RayTracPosiResu.InputData.SvpInfo{1,1}(:,1);
DiffSsp_munk = DiffSsp.munk;
DiffSsp_biline = DiffSsp.biline;
DiffSsp_essp = DiffSsp.essp;

line = ceil(size(statiSeri,1)/5);
for iStatiSeri = 1:size(statiSeri,1)
    obsTime = RayTracPosiResu.InputData.IniInfo{iStatiSeri}.gridTime;
    %Argo剖面
    subplot(line,5,iStatiSeri);
    plotProf_allProf([depth DiffSsp_munk(:,iStatiSeri)],'g-','声速剖面');hold on;
    plotProf_allProf([depth DiffSsp_biline(:,iStatiSeri)],'b-','声速剖面');hold on;
    plotProf_allProf([depth DiffSsp_essp(:,iStatiSeri)],'r-','声速剖面');hold on;
    axis([-40 40 0 2000]);
    TextTime.year = num2str(obsTime(1,1));
    if(obsTime(1,2) < 10)%统一日期标注
        TextTime.month = ['0' num2str(obsTime(1,2))];
    else
        TextTime.month = [num2str(obsTime(1,2))];
    end
	if(obsTime(1,3) < 10)
        TextTime.day = ['0' num2str(obsTime(1,3))];
    else
        TextTime.day = [num2str(obsTime(1,3))];
    end
	text(1510,1500,[TextTime.year ' '; TextTime.month '/' TextTime.day],'FontSize',8);%text(1460,-300,[TextTime.year '-' TextTime.month '-' TextTime.day],'FontSize',8);
    if(mod(iStatiSeri,5) ~= 1)%统一y轴标注
        set(gca,'yticklabel',[]);
    end
    if(iStatiSeri<(line-1)*5+1)
        set(gca,'xticklabel',[]);
    end
    if(iStatiSeri == 16)
        pos = axis;
        ylabel('深度 (m)');%,'position',[1405 (pos(3)+pos(4))/2]
    end
    if(iStatiSeri == line*5-2)%x轴标注
        pos = axis;
        xlabel('声速 (m/s)','position',[(pos(1)+pos(2))/2 2750]);
    elseif(iStatiSeri == (line-1)*5-2)
        if(size(statiSeri,1) < line*5-2)
            pos = axis;
            xlabel('声速 (m/s)','position',[(pos(1)+pos(2))/2 5300]);
        end
    end
    %grid on
end
set(gcf,'Units','centimeter','Position',[0 0 14.65 16]);
set(gca,'FontSize',8,'Fontname','黑体','FontWeight','bold');%
set(0,'defaultfigurecolor','w');
legend('Munk模型反演SSP','双线性模型反演SSP','指数型模型反演SSP','FontSize',8,'box','on','position',[0.45 0.90 0.1 0.1],'Orientation','horizon')
