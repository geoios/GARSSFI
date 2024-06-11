function [IniFileInfo] = getIniData(IniFileDetaPath)
%% 函数说明
%功能：获取配置文件信息
%输出：+IniFileInfo 配置文件信息
%% 功能代码
%获取配置文件信息
for iFile = 1:size(IniFileDetaPath,1)
    [IniFileInfo{iFile,1}] = getIniDataSing(IniFileDetaPath{iFile});
end

%% 辅助函数
    function [IniFileInfo] = getIniDataSing(IniFileDetaPath)
    %%函数说明
    %功能：读取key变量到结构体
    %%功能代码
    key = inifile(IniFileDetaPath);
    %时空坐标
    timeCell = strsplit(key{3,4},'-');
    IniFileInfo.time = compJdDay(str2double(timeCell{1}),str2double(timeCell{2}),str2double(timeCell{3}));%时间
    IniFileInfo.gridTime = [str2double(timeCell{1}) str2double(timeCell{2}) str2double(timeCell{3})];
    IniFileInfo.lon = str2double(key{11,4});%经度
    IniFileInfo.lat = str2double(key{10,4});%纬度
    IniFileInfo.high = str2double(key{12,4});%高度
    IniFileInfo.xAxisCoor = str2double(timeCell{1}) + str2double(timeCell{2})/12;
    %站名
    statNameCell = strsplit(key{13,4},' ');
    IniFileInfo.statName = cell2mat(statNameCell');%海底站点
    %站坐标初值
    for i = 1:size(statNameCell,2)
        statCoorCell = strsplit(key{14+i,4});
        statCoor(i,:) = [str2double(statCoorCell{1}) str2double(statCoorCell{2}) str2double(statCoorCell{3})];
    end
    IniFileInfo.statCoor = statCoor;
    %臂长
    armLengthCell = strsplit(key{end,4});
    IniFileInfo.armLength = [str2double(armLengthCell{1}) str2double(armLengthCell{2}) str2double(armLengthCell{3})];

%% 辅助函数
    function [key] = inifile(impoIniPath)
    %%函数说明
    %功能：读取ini文件到key变量
    %输入：+impoIniPath ini文件详细路径
    %输出：+key 读取元胞
    %%功能代码
    fid = fopen(impoIniPath);
    count = 0;
    while ~feof(fid)
        tline = fgetl(fid);
        if isempty(tline)
        %跳过空行
            continue;
        end
        %key读取
        if(contains(tline,'['))
            tline(find(isspace(tline))) = [];%去除空格
            keyWord = tline(2:end-1);%去除[]
            continue;
        end
        %跳过注释
        if(contains(tline,'#'))
            continue;
        end

        %赋值
            count = count + 1;
            key{count,1} = strtrim(keyWord);%去左右空格
            key{count,2} = '';%仿网络ini读取函数
            %分割
            secStr = split(tline,"=");%等号左右分割
            secStrLine = secStr';
            %三四元胞赋值
            countInsi = 0;
            for iColu = 3:3+size(secStrLine,2)-1
                if(size(secStrLine,2)>=2)
                    countInsi = countInsi + 1;
                    key{count,iColu} = strtrim(secStrLine{1,countInsi});
                end
            end

        %结束跳出
        if (tline == -1)
            %文件末尾跳出
            break;
        end
     end
     fclose(fid);