function [ObsInfo] = getObsData_merge(ObsFileDetaPath,armLength)
%% 函数说明
%功能：读取obs数据
%% 功能代码
ObsInfo = [];
for iFile = 1:size(ObsFileDetaPath,1)
    ObsInfoTemp = getObsDataSing(ObsFileDetaPath{iFile},armLength);
    ObsInfo = [ObsInfo;ObsInfoTemp];
end

%% 辅助函数
    function ObsTableInfo = getObsDataSing(ObsFileDetaPath,armLength)
        ObsTableInfo = readtable(ObsFileDetaPath);
        %臂长转换
        sPoints    = [ObsTableInfo.ant_e0 ObsTableInfo.ant_n0 ObsTableInfo.ant_u0];%发射时刻坐标
        rPoints    = [ObsTableInfo.ant_e1 ObsTableInfo.ant_n1 ObsTableInfo.ant_u1];
        sAttitude  = [ObsTableInfo.head0  ObsTableInfo.pitch0 ObsTableInfo.roll0];%姿态
        rAttitude  = [ObsTableInfo.head1  ObsTableInfo.pitch1 ObsTableInfo.roll1];
        for iEpoch = 1:size(ObsTableInfo,1)
            ObsTableInfo.tranEnu0(iEpoch,:) = armCalibration_SouthSea(armLength',sAttitude(iEpoch,:),sPoints(iEpoch,:));
            ObsTableInfo.tranEnu1(iEpoch,:) = armCalibration_SouthSea(armLength',rAttitude(iEpoch,:),rPoints(iEpoch,:));
        end
    end
end
