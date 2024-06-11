function [SvpFileInfo] = getSvpData(SvpFileDetaPath)
%% ����˵��
%���ܣ���ȡsvp�۲��ļ�
%% ���ܴ���
%��ȡ��������
for iFile = 1:size(SvpFileDetaPath,1)
    SvpTabl = readtable(SvpFileDetaPath{iFile});
    %��ȡ���ṹ������
    SvpFileInfo{iFile,1} = [SvpTabl.depth SvpTabl.speed];
    %��ȡ�ļ���
    [~,name,ext] = fileparts(SvpFileDetaPath{iFile});
    SvpFileInfo{iFile,2} = [name ext];
end
