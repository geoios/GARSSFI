function [RayTracPosiResu,OptSvp] = joinEsti(InputData)
%% ����˵��
%���ܣ�munkģ�����Ϲ���
%% ���ܴ���
statiSeri = (1:size(InputData.ObsInfo,1))';

%ģ�Ͳ���
ModelPar0.modeType = InputData.ModelPar0.modeType;
ModelPar0.p0 = InputData.ModelPar0.p0;
ModelPar0.size = size(InputData.ModelPar0.p0,2);
ModelPar0.lat = InputData.IniInfo{1}.lat;%Esspʹ��
ModelPar0.depth = InputData.SvpInfo{1}(:,1);

%ģ��Լ��ֵ
ConsSett.dc = InputData.ConsSett.dc;
ConsSett.dd = InputData.ConsSett.dd;
if(strcmpi(InputData.ModelPar0.modeType,'Munk'))
    ConsSett.fd = [InputData.StatsInfo.VbSurf(1);InputData.StatsInfo.Vb(1);InputData.StatsInfo.VbK(1)];
elseif(strcmpi(InputData.ModelPar0.modeType,'Bilinear'))
    ConsSett.fd = [InputData.StatsInfo.Vb(1)];
elseif(strcmpi(InputData.ModelPar0.modeType,'Essp'))
    ConsSett.fd = [InputData.StatsInfo.TbSurf(1);InputData.StatsInfo.Tb(1);InputData.StatsInfo.TbK(1)];%12
end

%����������
for iStatiSeriTempo = 1%:size(statiSeri,1)
    iStatiSeri = statiSeri(iStatiSeriTempo);
    try
        [RayTracPosiResu(iStatiSeri,1)] = compTranPosiResu_joinEsti(ModelPar0,ConsSett,InputData.IniInfo{iStatiSeri},InputData.ObsInfo{iStatiSeri});%��վ
    catch
        error(['���ݳ���' num2str(iStatiSeri)]);
    end
    %������������
	try
        OptSvp{iStatiSeri,1} = svpModelFun(RayTracPosiResu(iStatiSeri).svpModePar,ModelPar0);
        expoProfFile(OptSvp{iStatiSeri,1},InputData.expoOptProfPath,InputData.SvpInfo(iStatiSeri,2));
        disp(['��' num2str(iStatiSeri) '����SSP']);
    catch
        OptSvp{iStatiSeri,1} = [];
        disp(['��' num2str(iStatiSeri) '����SSP����']);
	end
end
