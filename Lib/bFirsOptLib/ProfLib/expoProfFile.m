function expoProfFile(Prof,filePathSave,FileNames)
%% ����˵��
%���ܣ�������������
%���룺+struProf �ṹ��������
%      +fileSavePath �ļ�����·��
%      +fileNames �ļ���
%�����*
%% ���ܴ���
lineName = {'depth' 'speed'}; 
%������
for iFile = 1:size(FileNames,1)
    resultTable = table(Prof(:,1),Prof(:,2),'VariableNames',lineName);
    writetable(resultTable,[filePathSave FileNames{iFile,1}]); 
end

