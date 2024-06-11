function [ObsInfo] = getObsData_merge(ObsFileDetaPath,armLength)
%% ����˵��
%���ܣ���ȡobs����
%% ���ܴ���
ObsInfo = [];
for iFile = 1:size(ObsFileDetaPath,1)
    ObsInfoTemp = getObsDataSing(ObsFileDetaPath{iFile},armLength);
    ObsInfo = [ObsInfo;ObsInfoTemp];
end

%% ��������
    function ObsTableInfo = getObsDataSing(ObsFileDetaPath,armLength)
        ObsTableInfo = readtable(ObsFileDetaPath);
        %�۳�ת��
        sPoints    = [ObsTableInfo.ant_e0 ObsTableInfo.ant_n0 ObsTableInfo.ant_u0];%����ʱ������
        rPoints    = [ObsTableInfo.ant_e1 ObsTableInfo.ant_n1 ObsTableInfo.ant_u1];
        sAttitude  = [ObsTableInfo.head0  ObsTableInfo.pitch0 ObsTableInfo.roll0];%��̬
        rAttitude  = [ObsTableInfo.head1  ObsTableInfo.pitch1 ObsTableInfo.roll1];
        for iEpoch = 1:size(ObsTableInfo,1)
            ObsTableInfo.tranEnu0(iEpoch,:) = armCalibration_SouthSea(armLength',sAttitude(iEpoch,:),sPoints(iEpoch,:));
            ObsTableInfo.tranEnu1(iEpoch,:) = armCalibration_SouthSea(armLength',rAttitude(iEpoch,:),rPoints(iEpoch,:));
        end
    end
end
