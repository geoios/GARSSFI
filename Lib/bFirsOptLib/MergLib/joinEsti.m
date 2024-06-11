function [RayTracPosiResu,OptSvp] = joinEsti(InputData)
%% 函数说明
%功能：munk模型联合估计
%% 功能代码
statiSeri = (1:size(InputData.ObsInfo,1))';

%模型参数
ModelPar0.modeType = InputData.ModelPar0.modeType;
ModelPar0.p0 = InputData.ModelPar0.p0;
ModelPar0.size = size(InputData.ModelPar0.p0,2);
ModelPar0.lat = InputData.IniInfo{1}.lat;%Essp使用
ModelPar0.depth = InputData.SvpInfo{1}(:,1);

%模型约束值
ConsSett.dc = InputData.ConsSett.dc;
ConsSett.dd = InputData.ConsSett.dd;
if(strcmpi(InputData.ModelPar0.modeType,'Munk'))
    ConsSett.fd = [InputData.StatsInfo.VbSurf(1);InputData.StatsInfo.Vb(1);InputData.StatsInfo.VbK(1)];
elseif(strcmpi(InputData.ModelPar0.modeType,'Bilinear'))
    ConsSett.fd = [InputData.StatsInfo.Vb(1)];
elseif(strcmpi(InputData.ModelPar0.modeType,'Essp'))
    ConsSett.fd = [InputData.StatsInfo.TbSurf(1);InputData.StatsInfo.Tb(1);InputData.StatsInfo.TbK(1)];%12
end

%计算批处理
for iStatiSeriTempo = 1%:size(statiSeri,1)
    iStatiSeri = statiSeri(iStatiSeriTempo);
    try
        [RayTracPosiResu(iStatiSeri,1)] = compTranPosiResu_joinEsti(ModelPar0,ConsSett,InputData.IniInfo{iStatiSeri},InputData.ObsInfo{iStatiSeri});%单站
    catch
        error(['反演出错' num2str(iStatiSeri)]);
    end
    %导出反演剖面
	try
        OptSvp{iStatiSeri,1} = svpModelFun(RayTracPosiResu(iStatiSeri).svpModePar,ModelPar0);
        expoProfFile(OptSvp{iStatiSeri,1},InputData.expoOptProfPath,InputData.SvpInfo(iStatiSeri,2));
        disp(['期' num2str(iStatiSeri) '导出SSP']);
    catch
        OptSvp{iStatiSeri,1} = [];
        disp(['期' num2str(iStatiSeri) '导出SSP错误']);
	end
end
