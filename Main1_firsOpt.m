%% 脚本说明
%功能：海底站坐标与声速剖面函数参数联合估计（MYGI站程序测试通过）
%% 脚本配置
clc;clear
fullPath = mfilename('fullpath');
[scriPath] = fileparts(fullPath);
%测站名获取
statName = ['CHOS';'FUKU';'KAMN';'KAMS';'MYGI';'MYGW';'TOS2'];
%导入
    load([scriPath '\Data_import\0ArgoSet\argo.mat']);%历史Argo观测
    %MYGI观测
    iStatNum = 5;
    impoIniPath = [scriPath '\Data_import\1JpnSet\data_Tohoku2011-2020\initcfg\' statName(iStatNum,:) '\'];
    impoObsPath = [scriPath '\Data_import\1JpnSet\data_Tohoku2011-2020\obsdata\' statName(iStatNum,:) '\' ];
%导出
    %优化剖面保存路径
    expoOptProfPath_munk = [scriPath '\Data_export\File\InveProf\' statName(iStatNum,:) '\1\'];initFolder(expoOptProfPath_munk);
    expoOptProfPath_biline = [scriPath '\Data_export\File\InveProf\' statName(iStatNum,:) '\2\'];initFolder(expoOptProfPath_biline);
    expoOptProfPath_essp = [scriPath '\Data_export\File\InveProf\' statName(iStatNum,:) '\3\'];initFolder(expoOptProfPath_essp);
    expoOptProfPath_infield = [scriPath '\Data_export\File\InveProf\' statName(iStatNum,:) '\4\'];initFolder(expoOptProfPath_infield);
    %图片保存路径
    expoFigPath = [scriPath '\Data_export\Fig\'];
    expoMatPath = [scriPath '\Data_export\Mat\'];

%% 标准声线跟踪定位
%读取文件
[IniFileDetaPath] = getFileDetaPath(impoIniPath,'*-initcfg.ini');
[SvpFileDetaPath] = getFileDetaPath(impoObsPath,'*-svp.csv');
[ObsFileDetaPath] = getFileDetaPath(impoObsPath,'*-obs.csv');
[IniInfo] = getIniData(IniFileDetaPath);
[SvpInfo] = getSvpData(SvpFileDetaPath);
[ObsInfo] = getObsData(ObsFileDetaPath,IniInfo,'Japan');
%定位
statiSeri = (1:size(ObsInfo,1))';
for iStatiSeri = 1:size(statiSeri,1)
    [RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri,1)] = compTransPositResu(IniInfo{iStatiSeri},SvpInfo{iStatiSeri},ObsInfo{iStatiSeri});
    disp(['完成测站' num2str(iStatiSeri) '声线跟踪定位']);%进程
end
copyfile(fullfile(impoObsPath,'*svp.csv'), expoOptProfPath_infield);
%先验统计信息
[StatsInfo,ArgoProf] = getArgoStats(argo,IniInfo,SvpInfo);
%绘图
    %温度先验信息
    figure;
    ArgoTempProf.depth = ArgoProf.depth;
    ArgoTempProf.data = ArgoProf.temperature;
    plotProf_timeSeri(ArgoTempProf,IniInfo{1}.xAxisCoor,'温度剖面');xlim([0 30])
    print(gcf,'-djpeg','-r600',[expoFigPath '邻近Argo温度剖面示意图']);
    %声速先验信息
    figure;
    ArgoVeloProf.depth = ArgoProf.depth;
    ArgoVeloProf.data = ArgoProf.acoSpeed;
    plotProf_timeSeri(ArgoVeloProf,IniInfo{1}.xAxisCoor,'声速剖面');
    print(gcf,'-djpeg','-r600',[expoFigPath '邻近Argo声速剖面示意图']);

%% 不同声速剖面模型反演
%公共传入
InputData.IniInfo = IniInfo;
InputData.SvpInfo = SvpInfo;
InputData.ObsInfo = ObsInfo;
InputData.StatsInfo = StatsInfo;
RayTracPosiResu.InputData = InputData;
%%Munk模型反演剖面%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%初值设置
ModelPar0.modeType = 'Munk';
ModelPar0.p0 = [0.0075 1475 1300 300];
%约束设置
ConsSett.dc = diag([(100)^2 (100)^2 (100)^2 (20)^2]);
ConsSett.dd = diag([(StatsInfo.VbSurf(2))^2 (0.01)^2 (0.00001)^2]);
%传入
InputData_munk = InputData;
InputData_munk.ModelPar0 = ModelPar0;
InputData_munk.ConsSett = ConsSett;
InputData_munk.expoOptProfPath = expoOptProfPath_munk;
%计算批处理
tic
[RayTracPosiResu.RayTracPosiResu_munk,InveSvp.InveSvp_munk] = joinEsti(InputData_munk);
toc
RayTracPosiResu.InputData_munk = InputData_munk;
%%双线性模型反演剖面%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%初值设置
ModelPar0.modeType = 'Bilinear';
ModelPar0.p0 = [1500 -0.1 0.01 300];
%约束设置
ConsSett.dc = diag([(StatsInfo.VbSurf(2))^2 (100)^2 (0.00001)^2 (20)^2]);
ConsSett.dd = diag([(0.01)^2]);
%传入
InputData_biline = InputData;
InputData_biline.ModelPar0 = ModelPar0;
InputData_biline.ConsSett = ConsSett;
InputData_biline.expoOptProfPath = expoOptProfPath_biline;
%计算批处理
[RayTracPosiResu.RayTracPosiResu_biline,InveSvp.InveSvp_biline] = joinEsti(InputData_biline);
RayTracPosiResu.InputData_biline = InputData_biline;
%%自构经验模型反演剖面%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%初值设置
ModelPar0.modeType = 'Essp';
ModelPar0.p0 = [2 10 300];
%约束设置
ConsSett.dc = diag([(100)^2 (100)^2 (20)^2]);
ConsSett.dd = diag([(StatsInfo.TbSurf(2))^2 (0.001)^2 (0.00001)^2]);%标准差小一个量级
%传入
InputData_essp = InputData;
InputData_essp.ModelPar0 = ModelPar0;
InputData_essp.ConsSett = ConsSett;
InputData_essp.expoOptProfPath = expoOptProfPath_essp;
%计算批处理
[RayTracPosiResu.RayTracPosiResu_essp,InveSvp.InveSvp_essp] = joinEsti(InputData_essp);
RayTracPosiResu.InputData_essp = InputData_essp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%绘图
    %反演声速剖面比较
    figure;plotInteSsp_compa(InveSvp,RayTracPosiResu);
    print(gcf,'-djpeg','-r600',[expoFigPath '不同函数反演结果比较']);
    save([expoMatPath 'Main1_firsOpt1.mat'],'RayTracPosiResu','InveSvp');

%% 精度比较
%声速剖面反演精度
for i = 1:size(RayTracPosiResu.InputData.ObsInfo,1)
    DiffSsp.munk(:,i) = RayTracPosiResu.InputData.SvpInfo{i,1}(:,2) - InveSvp.InveSvp_munk{i}(:,2);
    DiffSsp.biline(:,i) = RayTracPosiResu.InputData.SvpInfo{i,1}(:,2) - InveSvp.InveSvp_biline{i}(:,2);
    DiffSsp.essp(:,i) = RayTracPosiResu.InputData.SvpInfo{i,1}(:,2) - InveSvp.InveSvp_essp{i}(:,2);
end
%反演SSP定位精度
DiffInvePosi_rayTrack.InputData = RayTracPosiResu.InputData;
for iStatiSeri = 1:size(RayTracPosiResu.InputData.ObsInfo,1)
    DiffInvePosi_rayTrack.diffCoor_munk(iStatiSeri,:) = RayTracPosiResu.RayTracPosiResu_munk(iStatiSeri,:).centCoor - RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri,:).centCoor;
    DiffInvePosi_rayTrack.diffCoor_biline(iStatiSeri,:) = RayTracPosiResu.RayTracPosiResu_biline(iStatiSeri,:).centCoor - RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri,:).centCoor;
    DiffInvePosi_rayTrack.diffCoor_essp(iStatiSeri,:) = RayTracPosiResu.RayTracPosiResu_essp(iStatiSeri,:).centCoor - RayTracPosiResu.RayTracPosiResu_infield(iStatiSeri,:).centCoor;
end
%绘图
    %声速剖面残差图
    figure;plotInteSsp_compa2(DiffSsp,RayTracPosiResu);
    print(gcf,'-djpeg','-r600',[expoFigPath '声线跟踪定位反演声速剖面残差']);
    %声速剖面误差分布
    figure;plotSspErroStats(DiffSsp);
    print(gcf,'-djpeg','-r600',[expoFigPath '声线跟踪定位反演声速剖面误差分布']);
    %坐标误差序列
    figure;plotPositError_enu(DiffInvePosi_rayTrack);xlim([2011 2021]);%,'声速剖面解'
    %figure;plotPositError_enuAll(DiffInvePosi_rayTrack,'声速剖面解');
    print(gcf,'-djpeg','-r600',[expoFigPath '定位坐标_声线跟踪']);
    %观测残差
    figure
    plotDl(RayTracPosiResu);
    print(gcf,'-djpeg','-r600',[expoFigPath '声线跟踪定位观测残差']);
%制表
    %定位误差统计
    [PosiErroStatInfo_rayTrack] = statsDiffInviPosiPred(DiffInvePosi_rayTrack);

%% 保存
save([expoMatPath 'Main1.mat']);