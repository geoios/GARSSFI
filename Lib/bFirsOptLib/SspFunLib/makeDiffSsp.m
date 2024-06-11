function [MeanRes,StdRes] = makeDiffSsp(InveSvp,RayTracPosiResu)
%% 函数说明
%功能：计算声速剖面误差
%% 功能代码
for i = 1:size(RayTracPosiResu.statiSeri,1)
    diffSsp.munk(:,i) = RayTracPosiResu.JpnSvpInfo.sounVelo(:,i) - InveSvp.InveSvp_munk{i}(:,2);
    diffSsp.biline(:,i) = RayTracPosiResu.JpnSvpInfo.sounVelo(:,i) - InveSvp.InveSvp_biline{i}(:,2);
    diffSsp.essp(:,i) = RayTracPosiResu.JpnSvpInfo.sounVelo(:,i) - InveSvp.InveSvp_essp{i}(:,2);
end

diffSsp.munk10_300 = diffSsp.munk(2:31,:);
[MeanRes.munk(1),StdRes.munk(1)] = statsDiffInviSspPrec(diffSsp.munk10_300);
diffSsp.munk300_500 = diffSsp.munk(31:end,:);
[MeanRes.munk(2),StdRes.munk(2)] = statsDiffInviSspPrec(diffSsp.munk300_500);
diffSsp.munk500_end = diffSsp.munk(2:end,:);
[MeanRes.munk(3),StdRes.munk(3)] = statsDiffInviSspPrec(diffSsp.munk500_end);
% diffSsp.munk10_end = diffSsp.munk(2:end,:);
% [MeanRes.munk(4),StdRes.munk(4)] = statsDiffInviSspPrec(diffSsp.munk10_end);

diffSsp.biline10_300 = diffSsp.biline(2:31,:);
[MeanRes.biline(1),StdRes.biline(1)] = statsDiffInviSspPrec(diffSsp.biline10_300);
diffSsp.biline300_500 = diffSsp.biline(31:end,:);
[MeanRes.biline(2),StdRes.biline(2)] = statsDiffInviSspPrec(diffSsp.biline300_500);
diffSsp.biline500_end = diffSsp.biline(2:end,:);
[MeanRes.biline(3),StdRes.biline(3)] = statsDiffInviSspPrec(diffSsp.biline500_end);
% diffSsp.biline10_end = diffSsp.biline(2:end,:);
% [MeanRes.biline(4),StdRes.biline(4)] = statsDiffInviSspPrec(diffSsp.biline10_end);

diffSsp.essp10_300 = diffSsp.essp(2:31,:);
[MeanRes.essp(1),StdRes.essp(1)] = statsDiffInviSspPrec(diffSsp.essp10_300);
diffSsp.essp300_500 = diffSsp.essp(31:end,:);
[MeanRes.essp(2),StdRes.essp(2)] = statsDiffInviSspPrec(diffSsp.essp300_500);
diffSsp.essp500_end = diffSsp.essp(2:end,:);
[MeanRes.essp(3),StdRes.essp(3)] = statsDiffInviSspPrec(diffSsp.essp500_end);
% diffSsp.essp10_end = diffSsp.essp(2:end,:);
% [MeanRes.essp(4),StdRes.essp(4)] = statsDiffInviSspPrec(diffSsp.essp10_end);