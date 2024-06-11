function expoConsProfFile(statiSeri,impoObsPath,expoWmsProfPath)
%% 函数说明
%功能：导出常声速剖面文件

%% 功能代码
%导入路径
    %impoObsPath = 'E:\研究题目\2023上_ESSP三级优化\Data_import\data_Tohoku2011-2020\obsdata\MYGI\';
%导出路径
    %加权平均声速剖面保存路径
    %expoWmsProfPath = 'E:\研究题目\2023上_ESSP三级优化\Data_export\ConstantProf\';
    %initFolder(expoWmsProfPath);
%参数配置
    %statiSeri = [1:35];%测站序列

%% 加权平均声速剖面
%实测参考剖面信息
[SvpFileInfo] = getSvpData(impoObsPath);
m = size(SvpFileInfo.depth(:,1),1);
for iStatiSeri = 1:size(statiSeri,2)
    weigMeanSound(iStatiSeri,1) = 1450; %MeanVel([SvpFileInfo.depth(:,1) SvpFileInfo.sounVelo(:,statiSeri(iStatiSeri))]);
    prof = [SvpFileInfo.depth(:,1) repmat(weigMeanSound(iStatiSeri,1),m,1)];
    expoProfFile(prof,expoWmsProfPath,{SvpFileInfo.fileNames{statiSeri(iStatiSeri),1}});
end
