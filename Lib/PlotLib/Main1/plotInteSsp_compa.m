function plotInteSsp_compa(InveSvp,RayTracPosiResu)
%% 函数说明
%功能：绘制插值剖面
%% 功能代码
statiSeri = (1:size(RayTracPosiResu.RayTracPosiResu_infield,1))';
JpnSvpInfo = RayTracPosiResu.InputData.SvpInfo;
InteSsp_munk = InveSvp.InveSvp_munk;
InteSsp_biline = InveSvp.InveSvp_biline;
InteSsp_essp = InveSvp.InveSvp_essp;

line = ceil(size(statiSeri,1)/5);
for iStatiSeri = 1:size(statiSeri,1)
    obsTime = RayTracPosiResu.InputData.IniInfo{iStatiSeri}.gridTime;
    subplot(line,5,iStatiSeri);
    plotProf_allProf(JpnSvpInfo{iStatiSeri},'k-','声速剖面');hold on;%实测剖面
	if(~isempty(InteSsp_munk{iStatiSeri}))
        plotProf_allProf(InteSsp_munk{iStatiSeri}(2:end,:),'g-','声速剖面');%Argo剖面
    end
    if(~isempty(InteSsp_biline{iStatiSeri}))
        plotProf_allProf(InteSsp_biline{iStatiSeri}(2:end,:),'b-','声速剖面');%Argo剖面
    end
    if(~isempty(InteSsp_essp{iStatiSeri}))
        plotProf_allProf(InteSsp_essp{iStatiSeri}(2:end,:),'r-','声速剖面');%Argo剖面
    end
    axis([1450 1550 0 2000]);
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
	text(1500,1500,[TextTime.year ' '; TextTime.month '/' TextTime.day],'FontSize',8);%text(1460,-300,[TextTime.year '-' TextTime.month '-' TextTime.day],'FontSize',8);
    if(mod(iStatiSeri,5) ~= 1)%统一y轴标注
        set(gca,'yticklabel',[]);
    end
    if(iStatiSeri<(line-1)*5+1)
        set(gca,'xticklabel',[]);
    end
    if(iStatiSeri == 16)
        pos = axis;
        ylabel('深度 (m)','position',[1405 (pos(3)+pos(4))/2]);
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
end

legend('实测SSP','Munk模型反演SSP','双线性模型反演SSP','指数型模型反演SSP','FontSize',8,'box','on','position',[0.45 0.90 0.1 0.1],'Orientation','horizon')
set(gcf,'Units','centimeter','Position',[0 0 14.65 16]);
set(gca,'FontSize',8,'Fontname','黑体','FontWeight','bold');%
set(0,'defaultfigurecolor','w');