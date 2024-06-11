function initFolder(folderPath)
%% 函数说明
%功能：初始化文件夹
%输入：+folderPath 文件夹路径
%% 功能代码
%清空生成存储文件夹
if ~exist(folderPath,'dir')
    mkdir(folderPath);
else
    rmdir(folderPath,'s');
    mkdir(folderPath);
end

