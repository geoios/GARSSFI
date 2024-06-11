function [SvpFileInfo] = getSvpData(SvpFileDetaPath)
%% 函数说明
%功能：读取svp观测文件
%% 功能代码
%获取声速剖面
for iFile = 1:size(SvpFileDetaPath,1)
    SvpTabl = readtable(SvpFileDetaPath{iFile});
    %提取到结构体数组
    SvpFileInfo{iFile,1} = [SvpTabl.depth SvpTabl.speed];
    %提取文件名
    [~,name,ext] = fileparts(SvpFileDetaPath{iFile});
    SvpFileInfo{iFile,2} = [name ext];
end
