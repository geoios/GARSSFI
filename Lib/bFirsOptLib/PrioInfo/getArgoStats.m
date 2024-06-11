function [StatsInfo,ArgoProf] = getArgoStats(argo,IniInfo,SvpInfo)
%% ����˵��
%���ܣ���ȡArgoͳ����Ϣ
%% ���ܴ���
aimDepth = SvpInfo{1}(:,1);
%Argo��ȡ
ArgoRange.seaLayerNum = 27;
ArgoRange.lonRange = [IniInfo{1}.lon-1.5 IniInfo{1}.lon+1.5];%[128 140];%
ArgoRange.latRange = [IniInfo{1}.lat-1.5 IniInfo{1}.lat+1.5];%[39 41];%
ArgoRange.timeRange = [IniInfo{1}.time IniInfo{end}.time];
[ArgoProf] = getArgoData(argo,ArgoRange);

%% Tb����ͳ�ƣ�1727.80m��
%��ֵ
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoTempProf(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.temperature(:,iProf),aimDepth(:,1),'linear');
end
%ͳ��
seaBottTemp = inteArgoTempProf(end,:)';
StatsInfo.Tb = [mean(seaBottTemp);std(seaBottTemp)];

%% Tbб��ͳ��
depth_k = [aimDepth(end,1)-10;aimDepth(end,1)];
%��ֵ
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoTempProf_k(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.temperature(:,iProf),depth_k,'linear');
end
seaBottTbK = (inteArgoTempProf_k(end,:)-inteArgoTempProf_k(end-1,:)) / (depth_k(end,1)-depth_k(end-1,1));
StatsInfo.TbK = [mean(seaBottTbK);std(seaBottTbK)];

%% Vb����ͳ�ƣ�1727.80m��
%��ֵ
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoVeloProf(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.acoSpeed(:,iProf),aimDepth(:,1),'linear');
end
%ͳ��
seaBottVelo = inteArgoVeloProf(end,:)';
StatsInfo.Vb = [mean(seaBottVelo);std(seaBottVelo)];

%% Vbб��ͳ��
depth_k = [aimDepth(end,1)-10;aimDepth(end,1)];
%��ֵ
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoVeloProf_k(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.acoSpeed(:,iProf),depth_k,'linear');
end
seaBottVeloK = (inteArgoVeloProf_k(end,:)-inteArgoVeloProf_k(end-1,:)) / (depth_k(end,1)-depth_k(end-1,1));
StatsInfo.VbK = [mean(seaBottVeloK);std(seaBottVeloK)];

%% Sb����ͳ�ƣ�1727.80m��
%��ֵ
for iProf = 1:size(ArgoProf.pos,2)
    inteArgoSal(:,iProf) = interp1(ArgoProf.depth(:,1),ArgoProf.salinity(:,iProf),aimDepth(:,1),'linear');
end
%ͳ��
seaBottSal = inteArgoSal(end,:)';
StatsInfo.Sb = [mean(mean(ArgoProf.salinity))];%;std(seaBottSal)

%% �������١��¶�ͳ�ƣ�0 m��
seaSurfTemp = ArgoProf.temperature(1,:);
StatsInfo.TbSurf = [mean(seaSurfTemp);std(seaSurfTemp)];

seaSurfVelo = ArgoProf.acoSpeed(1,:);
StatsInfo.VbSurf = [mean(seaSurfVelo);std(seaSurfVelo)];
