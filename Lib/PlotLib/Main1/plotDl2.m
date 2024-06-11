function plotProf_sessp(secoOptResu1,secoOptResu2,secoOptResu3,secoOptResu4)
%% ����˵��
%���ܣ����������е�����Ƚ�ͼ
%% ���ܴ���
for iStatiSeri = 1:size(secoOptResu1.centCoor,1)
    dL_munk = secoOptResu1.dL{iStatiSeri};
    dL_biline = secoOptResu2.dL{iStatiSeri};
    dL_essp = secoOptResu3.dL{iStatiSeri};
    dL_infield = secoOptResu4.dL{iStatiSeri};

    subplot(7,5,iStatiSeri);
    plot(1:size(dL_munk,1),dL_munk,'g.','markers',15);hold on;
    plot(1:size(dL_biline,1),dL_biline,'b.','markers',15);hold on;
    plot(1:size(dL_essp,1),dL_essp,'r.','markers',10);hold on;
    plot(1:size(dL_infield,1),dL_infield,'k.','markers',5);

    epochNum = size(dL_infield,1);
	xlim([-ceil(epochNum*0.02),epochNum+ceil(epochNum*0.02)]);
    
    yMax = max([dL_munk;dL_biline;dL_essp]);
    yMin = min([dL_munk;dL_biline;dL_essp]);
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
        ylabel('��ͬ�������溯����Ӧ�Ĳв� (m)','position',[-epochNum*0.27 (pos(3)+pos(4))/2]);
    end
    if(iStatiSeri == 33)
        pos = axis;
        xlabel('��Ԫ��','position',[(pos(1)+pos(2))/2 yMin*2.5]);
    end
    set(gca,'FontSize',8,'Fontname','����');%,'FontWeight','bold'
end
set(gcf,'Units','centimeter','Position',[0 0 16.6 17.7]);
legend('Munkģ�ͷ���SSP','˫����ģ�ͷ���SSP','�Թ�����ģ�ͷ���SSP','ʵ��SSP','FontSize',8,'box','on','position',[0.46 0.9 0.1 0.1],'Orientation','horizon')
    

