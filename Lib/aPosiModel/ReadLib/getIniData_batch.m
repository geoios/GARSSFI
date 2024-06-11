function [IniFileInfo] = getIniData(filePath)
%% 函数说明
%功能：获取日本配置文件信息
%输入：+filePath 配置文件夹路径
%      +compJdDay() 计算儒略天函数
%      +inifile() 读取ini文件函数
%输出：+IniFileInfo 配置文件信息

%% 读取ini文件
%获取全部文件名
FolderInfo = dir(fullfile(filePath,'*.ini'));
fileNames = {FolderInfo.name}';
%获取配置文件信息
for iFile = 1:size(fileNames,1)
    fileDetaPath{iFile}=[filePath,'\',fileNames{iFile}];
    key = inifile(fileDetaPath{iFile});
    %转换为常规结构体
    cellTime = strsplit(key{3,4},'-');
    IniFileInfo.time(iFile,1) = compJdDay(str2double(cellTime{1}),str2double(cellTime{2}),str2double(cellTime{3}));%时间
    IniFileInfo.gridTime(iFile,:) = [str2double(cellTime{1}) str2double(cellTime{2}) str2double(cellTime{3})];%时间/格网插值用
    %IniFileInfo.timeJdHour(iFile,:) = compJdDay_h(str2double(cellTime{1}),str2double(cellTime{2}),str2double(cellTime{3}));%时间
    IniFileInfo.lon(iFile,1) = str2double(key{11,4});%经度
    IniFileInfo.lat(iFile,1) = str2double(key{10,4});%纬度
    IniFileInfo.high(iFile,1) = str2double(key{12,4});%高度
    IniFileInfo.seaFloorStation(iFile,1) = {strsplit(key{13,4},' ')};%海底站点
    IniFileInfo.timeLabel(iFile,:) = [str2double(cellTime{1}) str2double(cellTime{2}) str2double(cellTime{3})];
    %十进制时间
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
