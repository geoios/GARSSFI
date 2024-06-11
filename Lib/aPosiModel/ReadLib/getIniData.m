function [IniFileInfo] = getIniData(IniFileDetaPath)
%% ����˵��
%���ܣ���ȡ�����ļ���Ϣ
%�����+IniFileInfo �����ļ���Ϣ
%% ���ܴ���
%��ȡ�����ļ���Ϣ
for iFile = 1:size(IniFileDetaPath,1)
    [IniFileInfo{iFile,1}] = getIniDataSing(IniFileDetaPath{iFile});
end

%% ��������
    function [IniFileInfo] = getIniDataSing(IniFileDetaPath)
    %%����˵��
    %���ܣ���ȡkey�������ṹ��
    %%���ܴ���
    key = inifile(IniFileDetaPath);
    %ʱ������
    timeCell = strsplit(key{3,4},'-');
    IniFileInfo.time = compJdDay(str2double(timeCell{1}),str2double(timeCell{2}),str2double(timeCell{3}));%ʱ��
    IniFileInfo.gridTime = [str2double(timeCell{1}) str2double(timeCell{2}) str2double(timeCell{3})];
    IniFileInfo.lon = str2double(key{11,4});%����
    IniFileInfo.lat = str2double(key{10,4});%γ��
    IniFileInfo.high = str2double(key{12,4});%�߶�
    IniFileInfo.xAxisCoor = str2double(timeCell{1}) + str2double(timeCell{2})/12;
    %վ��
    statNameCell = strsplit(key{13,4},' ');
    IniFileInfo.statName = cell2mat(statNameCell');%����վ��
    %վ�����ֵ
    for i = 1:size(statNameCell,2)
        statCoorCell = strsplit(key{14+i,4});
        statCoor(i,:) = [str2double(statCoorCell{1}) str2double(statCoorCell{2}) str2double(statCoorCell{3})];
    end
    IniFileInfo.statCoor = statCoor;
    %�۳�
    armLengthCell = strsplit(key{end,4});
    IniFileInfo.armLength = [str2double(armLengthCell{1}) str2double(armLengthCell{2}) str2double(armLengthCell{3})];

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