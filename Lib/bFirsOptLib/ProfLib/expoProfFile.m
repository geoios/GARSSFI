function expoProfFile(Prof,filePathSave,FileNames)
%% 函数说明
%功能：常声速作剖面
%输入：+struProf 结构声速剖面
%      +fileSavePath 文件保存路径
%      +fileNames 文件名
%输出：*
%% 功能代码
lineName = {'depth' 'speed'}; 
%批导出
for iFile = 1:size(FileNames,1)
    resultTable = table(Prof(:,1),Prof(:,2),'VariableNames',lineName);
    writetable(resultTable,[filePathSave FileNames{iFile,1}]); 
end

