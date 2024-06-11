function [IniFileInfo] = getIniData(filePath)
%% ����˵��
%���ܣ���ȡ�ձ������ļ���Ϣ
%���룺+filePath �����ļ���·��
%      +compJdDay() ���������캯��
%      +inifile() ��ȡini�ļ�����
%�����+IniFileInfo �����ļ���Ϣ

%% ��ȡini�ļ�
%��ȡȫ���ļ���
FolderInfo = dir(fullfile(filePath,'*.ini'));
fileNames = {FolderInfo.name}';
%��ȡ�����ļ���Ϣ
for iFile = 1:size(fileNames,1)
    fileDetaPath{iFile}=[filePath,'\',fileNames{iFile}];
    key = inifile(fileDetaPath{iFile});
    %ת��Ϊ����ṹ��
    cellTime = strsplit(key{3,4},'-');
    IniFileInfo.time(iFile,1) = compJdDay(str2double(cellTime{1}),str2double(cellTime{2}),str2double(cellTime{3}));%ʱ��
    IniFileInfo.gridTime(iFile,:) = [str2double(cellTime{1}) str2double(cellTime{2}) str2double(cellTime{3})];%ʱ��/������ֵ��
    %IniFileInfo.timeJdHour(iFile,:) = compJdDay_h(str2double(cellTime{1}),str2double(cellTime{2}),str2double(cellTime{3}));%ʱ��
    IniFileInfo.lon(iFile,1) = str2double(key{11,4});%����
    IniFileInfo.lat(iFile,1) = str2double(key{10,4});%γ��
    IniFileInfo.high(iFile,1) = str2double(key{12,4});%�߶�
    IniFileInfo.seaFloorStation(iFile,1) = {strsplit(key{13,4},' ')};%����վ��
    IniFileInfo.timeLabel(iFile,:) = [str2double(cellTime{1}) str2double(cellTime{2}) str2double(cellTime{3})];
    %ʮ����ʱ��
    cellTimeJd = strsplit(key{4,4},'-');
    cellTimeJd_num = [str2double(cellTimeJd{1}) str2double(cellTimeJd{2})];
    if(( rem(cellTimeJd_num(1),100) ~= 0 && rem(cellTimeJd_num(1),4) == 0 )|| rem(cellTimeJd_num(1),400) == 0) 
        dayPerYearArray = 366;
    else
        dayPerYearArray = 365;
    end
    IniFileInfo.xAxisCoor(iFile,1) = cellTimeJd_num(1) + cellTimeJd_num(2)/dayPerYearArray;
end
IniFileInfo.pos = [IniFileInfo.lon(:,1) IniFileInfo.lat(:,1) IniFileInfo.time(:,1)]';

%% ��������
    function [key] = inifile(impoIniPath)
    %%����˵��
    %���ܣ���ȡini�ļ���key����
    %���룺+impoIniPath ini�ļ���ϸ·��
    %�����+key ��ȡԪ��
    %%���ܴ���
    fid = fopen(impoIniPath);
    count = 0;
    while ~feof(fid)
        tline = fgetl(fid);
        if isempty(tline)
        %��������
            continue;
        end
        %key��ȡ
        if(contains(tline,'['))
            tline(find(isspace(tline))) = [];%ȥ���ո�
            keyWord = tline(2:end-1);%ȥ��[]
            continue;
        end
        %����ע��
        if(contains(tline,'#'))
            continue;
        end

        %��ֵ
            count = count + 1;
            key{count,1} = strtrim(keyWord);%ȥ���ҿո�
            key{count,2} = '';%������ini��ȡ����
            %�ָ�
            secStr = split(tline,"=");%�Ⱥ����ҷָ�
            secStrLine = secStr';
            %����Ԫ����ֵ
            countInsi = 0;
            for iColu = 3:3+size(secStrLine,2)-1
                if(size(secStrLine,2)>=2)
                    countInsi = countInsi + 1;
                    key{count,iColu} = strtrim(secStrLine{1,countInsi});
                end
            end

        %��������
        if (tline == -1)
            %�ļ�ĩβ����
            break;
        end
     end
     fclose(fid);
