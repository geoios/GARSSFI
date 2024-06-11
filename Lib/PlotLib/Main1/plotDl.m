function plotProf_sessp(RayTracPosiResu)
%% 函数说明
%功能：绘制文章中的剖面比较图
%% 功能代码
for iStatiSeri = 1:size(RayTracPosiResu.InputData.ObsInfo,1)
    dL_munk = RayTracPosiResu.RayTracPosiResu_munk(iStatiSeri).dL;
    dL_biline = RayTracPosiResu.RayTracPosiResu_biline(iStatiSeri).dL;
    dL_essp = RayTracPosiResu.RayTracPosiResu_essp(iStatiSeri).dL;
    dL_infield = RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri).dL;

    P1 = diag(desiWeit(dL_munk,0));
    P2 = diag(desiWeit(dL_biline,0));
    P3 = diag(desiWeit(dL_essp,0));
    P4 = diag(desiWeit(dL_infield,0));

    subplot(7,5,iStatiSeri);
    plot(1:size(dL_munk,1),dL_munk.*P1,'g.','markers',15);hold on;
    plot(1:size(dL_biline,1),dL_biline.*P2,'b.','markers',15);hold on;
    plot(1:size(dL_essp,1),dL_essp.*P3,'r.','markers',10);hold on;
    plot(1:size(dL_infield,1),dL_infield.*P4,'k.','markers',5);

    epochNum = size(dL_infield,1);
	xlim([-ceil(epochNum*0.02),epochNum+ceil(epochNum*0.02)]);
    
    yMax = max([dL_munk.*P1;dL_biline.*P2;dL_essp.*P3]);
    yMin = min([dL_munk.*P1;dL_biline.*P2;dL_essp.*P3]);
    %ylim([yMin*1.1,yMax*1.1]);
    ylab = max([abs(ceil(yMin)) abs(ceil(yMax))]);
    yticks(-ylab:ylab:ylab);
    ylim([-ylab,ylab]);
    
    xticks(0:(epochNum+ceil(epochNum*0.02)):(epochNum+ceil(epochNum*0.02)))
    if(mod(iStatiSeri,5) ~= 1)
        %set(gca,'yticklabel',[]);
    %else
        %set(gca,'yticklabel',[0:500:1727.8]);
    end
    if(iStatiSeri<31)
        %set(gca,'xticklabel',[]);
    end
    if(iStatiSeri == 16)
        pos = axis;
        ylabel('不同声速剖面函数对应残差 (m)','position',[-epochNum*0.27 (pos(3)+pos(4))/2]);
    end
    if(iStatiSeri == 33)
        pos = axis;
        xlabel('历元数','position',[(pos(1)+pos(2))/2 yMin*2.5]);
    end
    set(gca,'FontSize',8,'Fontname','黑体');%,'FontWeight','bold'
end
set(gcf,'Units','centimeter','Position',[0 0 16.6 17.7]);
legend('Munk模型反演SSP','双线性模型反演SSP','自构经验模型反演SSP','实测SSP','FontSize',8,'box','on','position',[0.46 0.9 0.1 0.1],'Orientation','horizon')
    

