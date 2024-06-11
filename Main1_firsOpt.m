%% �ű�˵��
%���ܣ�����վ�������������溯���������Ϲ��ƣ�MYGIվ�������ͨ����
%% �ű�����
clc;clear
fullPath = mfilename('fullpath');
[scriPath] = fileparts(fullPath);
%��վ����ȡ
statName = ['CHOS';'FUKU';'KAMN';'KAMS';'MYGI';'MYGW';'TOS2'];
%����
    load([scriPath '\Data_import\0ArgoSet\argo.mat']);%��ʷArgo�۲�
    %MYGI�۲�
    iStatNum = 5;
    impoIniPath = [scriPath '\Data_import\1JpnSet\data_Tohoku2011-2020\initcfg\' statName(iStatNum,:) '\'];
    impoObsPath = [scriPath '\Data_import\1JpnSet\data_Tohoku2011-2020\obsdata\' statName(iStatNum,:) '\' ];
%����
    %�Ż����汣��·��
    expoOptProfPath_munk = [scriPath '\Data_export\File\InveProf\' statName(iStatNum,:) '\1\'];initFolder(expoOptProfPath_munk);
    expoOptProfPath_biline = [scriPath '\Data_export\File\InveProf\' statName(iStatNum,:) '\2\'];initFolder(expoOptProfPath_biline);
    expoOptProfPath_essp = [scriPath '\Data_export\File\InveProf\' statName(iStatNum,:) '\3\'];initFolder(expoOptProfPath_essp);
    expoOptProfPath_infield = [scriPath '\Data_export\File\InveProf\' statName(iStatNum,:) '\4\'];initFolder(expoOptProfPath_infield);
    %ͼƬ����·��
    expoFigPath = [scriPath '\Data_export\Fig\'];
    expoMatPath = [scriPath '\Data_export\Mat\'];

%% ��׼���߸��ٶ�λ
%��ȡ�ļ�
[IniFileDetaPath] = getFileDetaPath(impoIniPath,'*-initcfg.ini');
[SvpFileDetaPath] = getFileDetaPath(impoObsPath,'*-svp.csv');
[ObsFileDetaPath] = getFileDetaPath(impoObsPath,'*-obs.csv');
[IniInfo] = getIniData(IniFileDetaPath);
[SvpInfo] = getSvpData(SvpFileDetaPath);
[ObsInfo] = getObsData(ObsFileDetaPath,IniInfo,'Japan');
%��λ
statiSeri = (1:size(ObsInfo,1))';
for iStatiSeri = 1:size(statiSeri,1)
    [RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri,1)] = compTransPositResu(IniInfo{iStatiSeri},SvpInfo{iStatiSeri},ObsInfo{iStatiSeri});
    disp(['��ɲ�վ' num2str(iStatiSeri) '���߸��ٶ�λ']);%����
end
copyfile(fullfile(impoObsPath,'*svp.csv'), expoOptProfPath_infield);
%����ͳ����Ϣ
[StatsInfo,ArgoProf] = getArgoStats(argo,IniInfo,SvpInfo);
%��ͼ
    %�¶�������Ϣ
    figure;
    ArgoTempProf.depth = ArgoProf.depth;
    ArgoTempProf.data = ArgoProf.temperature;
    plotProf_timeSeri(ArgoTempProf,IniInfo{1}.xAxisCoor,'�¶�����');xlim([0 30])
    print(gcf,'-djpeg','-r600',[expoFigPath '�ڽ�Argo�¶�����ʾ��ͼ']);
    %����������Ϣ
    figure;
    ArgoVeloProf.depth = ArgoProf.depth;
    ArgoVeloProf.data = ArgoProf.acoSpeed;
    plotProf_timeSeri(ArgoVeloProf,IniInfo{1}.xAxisCoor,'��������');
    print(gcf,'-djpeg','-r600',[expoFigPath '�ڽ�Argo��������ʾ��ͼ']);

%% ��ͬ��������ģ�ͷ���
%��������
InputData.IniInfo = IniInfo;
InputData.SvpInfo = SvpInfo;
InputData.ObsInfo = ObsInfo;
InputData.StatsInfo = StatsInfo;
RayTracPosiResu.InputData = InputData;
%%Munkģ�ͷ�������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ֵ����
ModelPar0.modeType = 'Munk';
ModelPar0.p0 = [0.0075 1475 1300 300];
%Լ������
ConsSett.dc = diag([(100)^2 (100)^2 (100)^2 (20)^2]);
ConsSett.dd = diag([(StatsInfo.VbSurf(2))^2 (0.01)^2 (0.00001)^2]);
%����
InputData_munk = InputData;
InputData_munk.ModelPar0 = ModelPar0;
InputData_munk.ConsSett = ConsSett;
InputData_munk.expoOptProfPath = expoOptProfPath_munk;
%����������
tic
[RayTracPosiResu.RayTracPosiResu_munk,InveSvp.InveSvp_munk] = joinEsti(InputData_munk);
toc
RayTracPosiResu.InputData_munk = InputData_munk;
%%˫����ģ�ͷ�������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ֵ����
ModelPar0.modeType = 'Bilinear';
ModelPar0.p0 = [1500 -0.1 0.01 300];
%Լ������
ConsSett.dc = diag([(StatsInfo.VbSurf(2))^2 (100)^2 (0.00001)^2 (20)^2]);
ConsSett.dd = diag([(0.01)^2]);
%����
InputData_biline = InputData;
InputData_biline.ModelPar0 = ModelPar0;
InputData_biline.ConsSett = ConsSett;
InputData_biline.expoOptProfPath = expoOptProfPath_biline;
%����������
[RayTracPosiResu.RayTracPosiResu_biline,InveSvp.InveSvp_biline] = joinEsti(InputData_biline);
RayTracPosiResu.InputData_biline = InputData_biline;
%%�Թ�����ģ�ͷ�������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ֵ����
ModelPar0.modeType = 'Essp';
ModelPar0.p0 = [2 10 300];
%Լ������
ConsSett.dc = diag([(100)^2 (100)^2 (20)^2]);
ConsSett.dd = diag([(StatsInfo.TbSurf(2))^2 (0.001)^2 (0.00001)^2]);%��׼��Сһ������
%����
InputData_essp = InputData;
InputData_essp.ModelPar0 = ModelPar0;
InputData_essp.ConsSett = ConsSett;
InputData_essp.expoOptProfPath = expoOptProfPath_essp;
%����������
[RayTracPosiResu.RayTracPosiResu_essp,InveSvp.InveSvp_essp] = joinEsti(InputData_essp);
RayTracPosiResu.InputData_essp = InputData_essp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ͼ
    %������������Ƚ�
    figure;plotInteSsp_compa(InveSvp,RayTracPosiResu);
    print(gcf,'-djpeg','-r600',[expoFigPath '��ͬ�������ݽ���Ƚ�']);
    save([expoMatPath 'Main1_firsOpt1.mat'],'RayTracPosiResu','InveSvp');

%% ���ȱȽ�
%�������淴�ݾ���
for i = 1:size(RayTracPosiResu.InputData.ObsInfo,1)
    DiffSsp.munk(:,i) = RayTracPosiResu.InputData.SvpInfo{i,1}(:,2) - InveSvp.InveSvp_munk{i}(:,2);
    DiffSsp.biline(:,i) = RayTracPosiResu.InputData.SvpInfo{i,1}(:,2) - InveSvp.InveSvp_biline{i}(:,2);
    DiffSsp.essp(:,i) = RayTracPosiResu.InputData.SvpInfo{i,1}(:,2) - InveSvp.InveSvp_essp{i}(:,2);
end
%����SSP��λ����
DiffInvePosi_rayTrack.InputData = RayTracPosiResu.InputData;
for iStatiSeri = 1:size(RayTracPosiResu.InputData.ObsInfo,1)
    DiffInvePosi_rayTrack.diffCoor_munk(iStatiSeri,:) = RayTracPosiResu.RayTracPosiResu_munk(iStatiSeri,:).centCoor - RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri,:).centCoor;
    DiffInvePosi_rayTrack.diffCoor_biline(iStatiSeri,:) = RayTracPosiResu.RayTracPosiResu_biline(iStatiSeri,:).centCoor - RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri,:).centCoor;
    DiffInvePosi_rayTrack.diffCoor_essp(iStatiSeri,:) = RayTracPosiResu.RayTracPosiResu_essp(iStatiSeri,:).centCoor - RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri,:).centCoor;
end
%��ͼ
    %��������в�ͼ
    figure;plotInteSsp_compa2(DiffSsp,RayTracPosiResu);
    print(gcf,'-djpeg','-r600',[expoFigPath '���߸��ٶ�λ������������в�']);
    %�����������ֲ�
    figure;plotSspErroStats(DiffSsp);
    print(gcf,'-djpeg','-r600',[expoFigPath '���߸��ٶ�λ���������������ֲ�']);
    %�����������
    figure;plotPositError_enu(DiffInvePosi_rayTrack);xlim([2011 2021]);%,'���������'
    %figure;plotPositError_enuAll(DiffInvePosi_rayTrack,'���������');
    print(gcf,'-djpeg','-r600',[expoFigPath '��λ����_���߸���']);
    %�۲�в�
    figure
    plotDl(RayTracPosiResu);
    print(gcf,'-djpeg','-r600',[expoFigPath '���߸��ٶ�λ�۲�в�']);
%�Ʊ�
    %��λ���ͳ��
    [PosiErroStatInfo_rayTrack] = statsDiffInviPosiPred(DiffInvePosi_rayTrack);

%% ����
save([expoMatPath 'Main1.mat']);