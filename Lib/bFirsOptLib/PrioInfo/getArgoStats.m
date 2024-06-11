function [StatsInfo,ArgoProf] = getArgoStats(argo,IniInfo,SvpInfo)
%% 函数说明
%功能：获取Argo统计信息
%% 功能代码
aimDepth = SvpInfo{1}(:,1);
%Argo读取
ArgoRange.seaLayerNum = 27;
ArgoRange.lonRange = [IniInfo{1}.lon-1.5 IniInfo{1}.lon+1.5];%[128 140];%
ArgoRange.latRange = [IniInfo{1}.lat-1.5 IniInfo{1}.lat+1.5];%[39 41];%
ArgoRange.timeRange = [IniInfo{1}.time IniInfo{end}.time];
[ArgoProf] = getArgoData(argo,ArgoRange);

%% Tb参数统计（1727.80m）
%插值
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoTempProf(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.temperature(:,iProf),aimDepth(:,1),'linear');
end
%统计
seaBottTemp = inteArgoTempProf(end,:)';
StatsInfo.Tb = [mean(seaBottTemp);std(seaBottTemp)];

%% Tb斜率统计
depth_k = [aimDepth(end,1)-10;aimDepth(end,1)];
%插值
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoTempProf_k(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.temperature(:,iProf),depth_k,'linear');
end
seaBottTbK = (inteArgoTempProf_k(end,:)-inteArgoTempProf_k(end-1,:)) / (depth_k(end,1)-depth_k(end-1,1));
StatsInfo.TbK = [mean(seaBottTbK);std(seaBottTbK)];

%% Vb参数统计（1727.80m）
%插值
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoVeloProf(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.acoSpeed(:,iProf),aimDepth(:,1),'linear');
end
%统计
seaBottVelo = inteArgoVeloProf(end,:)';
StatsInfo.Vb = [mean(seaBottVelo);std(seaBottVelo)];

%% Vb斜率统计
depth_k = [aimDepth(end,1)-10;aimDepth(end,1)];
%插值
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoVeloProf_k(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.acoSpeed(:,iProf),depth_k,'linear');
end
seaBottVeloK = (inteArgoVeloProf_k(end,:)-inteArgoVeloProf_k(end-1,:)) / (depth_k(end,1)-depth_k(end-1,1));
StatsInfo.VbK = [mean(seaBottVeloK);std(seaBottVeloK)];

%% Sb参数统计（1727.80m）
%插值
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoSal(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.salinity(:,iProf),aimDepth(:,1),'linear');
end
%统计
seaBottSal = inteArgoSal(end,:)';
StatsInfo.Sb = [mean(mean(ArgoProf.salinity))];%;std(seaBottSal)

%% 海面声速、温度统计（0 m）
seaSurfTemp = ArgoProf.temperature(1,:);
StatsInfo.TbSurf = [mean(seaSurfTemp);std(seaSurfTemp)];

seaSurfVelo = ArgoProf.acoSpeed(1,:);
StatsInfo.VbSurf = [mean(seaSurfVelo);std(seaSurfVelo)];
