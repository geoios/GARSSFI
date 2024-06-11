function expoConsProfFile(statiSeri,impoObsPath,expoWmsProfPath)
%% ����˵��
%���ܣ����������������ļ�

%% ���ܴ���
%����·��
    %impoObsPath = 'E:\�о���Ŀ\2023��_ESSP�����Ż�\Data_import\data_Tohoku2011-2020\obsdata\MYGI\';
%����·��
    %��Ȩƽ���������汣��·��
    %expoWmsProfPath = 'E:\�о���Ŀ\2023��_ESSP�����Ż�\Data_export\ConstantProf\';
    %initFolder(expoWmsProfPath);
%��������
    %statiSeri = [1:35];%��վ����

%% ��Ȩƽ����������
%ʵ��ο�������Ϣ
[SvpFileInfo] = getSvpData(impoObsPath);
m = size(SvpFileInfo.depth(:,1),1);
for iStatiSeri = 1:size(statiSeri,2)
    weigMeanSound(iStatiSeri,1) = 1450; %MeanVel([SvpFileInfo.depth(:,1) SvpFileInfo.sounVelo(:,statiSeri(iStatiSeri))]);
    prof = [SvpFileInfo.depth(:,1) repmat(weigMeanSound(iStatiSeri,1),m,1)];
    expoProfFile(prof,expoWmsProfPath,{SvpFileInfo.fileNames{statiSeri(iStatiSeri),1}});
end
