function [FileDetaPath] = getFileDetaPath(pubPath,fileType)
%% ����˵��
%���ܣ���ȡ��ǰ�ļ������ļ���ϸ·��
%���룺+pubPath ����·��
%      +fileType ʶ������
%�����+FileDetaPath ��ǰ�ļ������ļ���ȫ��·��
%% ���ܴ���
FileInfo = dir(fullfile(pubPath,fileType));
FileNames = {FileInfo.name}';
for i = 1:size(FileNames,1) 
    FileDetaPath{i,1} = [pubPath FileNames{i,1}];
end