function initFolder(folderPath)
%% ����˵��
%���ܣ���ʼ���ļ���
%���룺+folderPath �ļ���·��
%% ���ܴ���
%������ɴ洢�ļ���
if ~exist(folderPath,'dir')
    mkdir(folderPath);
else
    rmdir(folderPath,'s');
    mkdir(folderPath);
end

