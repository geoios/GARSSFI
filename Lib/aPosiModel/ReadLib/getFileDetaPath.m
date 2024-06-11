function [FileDetaPath] = getFileDetaPath(pubPath,fileType)
%% 函数说明
%功能：获取当前文件夹下文件详细路径
%输入：+pubPath 公共路径
%      +fileType 识别类型
%输出：+FileDetaPath 当前文件夹下文件的全称路径
%% 功能代码
FileInfo = dir(fullfile(pubPath,fileType));
FileNames = {FileInfo.name}';
for i = 1:size(FileNames,1) 
    FileDetaPath{i,1} = [pubPath FileNames{i,1}];
end