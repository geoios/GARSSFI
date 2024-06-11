function [MeanRes,StdRes] = makeDiffSsp_cons(InveSvp_cons,RayTracPosiResu_cons,num1,num2)
%% 函数说明
%功能：计算声速剖面误差
%% 功能代码
for i = 1:size(RayTracPosiResu_cons.statiSeri,1)
    diffSsp.surf0AddBott1_1(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf0AddBott1_1{i}(:,2);
    diffSsp.surf0AddBott1_2(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf0AddBott1_2{i}(:,2);
    diffSsp.surf0AddBott1_3(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf0AddBott1_3{i}(:,2);
    
    diffSsp.surf1AddBott0_1(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf1AddBott0_1{i}(:,2);
    diffSsp.surf1AddBott0_2(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf1AddBott0_2{i}(:,2);
    diffSsp.surf1AddBott0_3(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf1AddBott0_3{i}(:,2);
    
	diffSsp.surf1AddBott1_1(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf1AddBott1_1{i}(:,2);
    diffSsp.surf1AddBott1_2(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf1AddBott1_2{i}(:,2);
    diffSsp.surf1AddBott1_3(:,i) = RayTracPosiResu_cons.JpnSvpInfo.sounVelo(:,i) - InveSvp_cons.InveSvp_surf1AddBott1_3{i}(:,2);
end

% num = 32;
[MeanRes.munk(1),StdRes.munk(1)] = statsDiffInviSspPrec(diffSsp.surf0AddBott1_1(num1:num2,:));
[MeanRes.munk(2),StdRes.munk(2)] = statsDiffInviSspPrec(diffSsp.surf1AddBott0_1(num1:num2,:));
[MeanRes.munk(3),StdRes.munk(3)] = statsDiffInviSspPrec(diffSsp.surf1AddBott1_1(num1:num2,:));

[MeanRes.biline(1),StdRes.biline(1)] = statsDiffInviSspPrec(diffSsp.surf0AddBott1_2(num1:num2,:));
[MeanRes.biline(2),StdRes.biline(2)] = statsDiffInviSspPrec(diffSsp.surf1AddBott0_2(num1:num2,:));
[MeanRes.biline(3),StdRes.biline(3)] = statsDiffInviSspPrec(diffSsp.surf1AddBott1_2(num1:num2,:));

[MeanRes.essp(1),StdRes.essp(1)] = statsDiffInviSspPrec(diffSsp.surf0AddBott1_3(num1:num2,:));
[MeanRes.essp(2),StdRes.essp(2)] = statsDiffInviSspPrec(diffSsp.surf1AddBott0_3(num1:num2,:));
[MeanRes.essp(3),StdRes.essp(3)] = statsDiffInviSspPrec(diffSsp.surf1AddBott1_3(num1:num2,:));