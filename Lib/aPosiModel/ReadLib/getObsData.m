function [ObsInfo] = getObsData(ObsFileDetaPath,IniInfo,area)
%% ����˵��
%���ܣ���ȡobs����
%% ���ܴ���
%������
for iFile = 1:size(ObsFileDetaPath,1)
    ObsInfo{iFile,1} = getObsDataSing(ObsFileDetaPath{iFile},IniInfo{iFile}.armLength,area);
end

%% ��������
    function ObsTableInfo = getObsDataSing(ObsFileDetaPath,armLength,area)
        ObsTableInfo = readtable(ObsFileDetaPath);
        %�۳�ת��
        sPoints    = [ObsTableInfo.ant_e0 ObsTableInfo.ant_n0 ObsTableInfo.ant_u0];%����ʱ������
        rPoints    = [ObsTableInfo.ant_e1 ObsTableInfo.ant_n1 ObsTableInfo.ant_u1];
        sAttitude  = [ObsTableInfo.head0  ObsTableInfo.pitch0 ObsTableInfo.roll0];%��̬
        rAttitude  = [ObsTableInfo.head1  ObsTableInfo.pitch1 ObsTableInfo.roll1];
        for iEpoch = 1:size(ObsTableInfo,1)
            if(strcmp('SouthSea',area))
                ObsTableInfo.tranEnu0(iEpoch,:) = armCalibration_SouthSea(armLength',sAttitude(iEpoch,:),sPoints(iEpoch,:));
                ObsTableInfo.tranEnu1(iEpoch,:) = armCalibration_SouthSea(armLength',rAttitude(iEpoch,:),rPoints(iEpoch,:));
            elseif(strcmp('Japan',area))
                ObsTableInfo.tranEnu0(iEpoch,:) = armCalibration_Japan(armLength',sAttitude(iEpoch,:),sPoints(iEpoch,:));
                ObsTableInfo.tranEnu1(iEpoch,:) = armCalibration_Japan(armLength',rAttitude(iEpoch,:),rPoints(iEpoch,:));
            else
                error('����ѡ�����');
            end
        end
    end
end
