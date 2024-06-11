function [JdDay] = compJdDay(year,month,day)
%% 函数说明
%功能：将UTC转换为2000-1-1-00:00的儒略日
%输入：+year 年
%      +month 月
%      +day 日
%输出：+JdDay 儒略日

%% 功能代码
%年月数组
yearArray = (2000:1:year-1)';
monthArrayOrdiYear = [31 28 31 30 31 30 31 31 30 31 30 31]';
monthArrayLeapYear = [31 29 31 30 31 30 31 31 30 31 30 31]';

%% 计算day/year
if(year == 2000)
    dayPerYearArray = 0;
elseif(year > 2000)
    for iYear = 1:size(yearArray,1)
        if(( rem(yearArray(iYear),100) ~= 0 && rem(yearArray(iYear),4) == 0 )|| rem(yearArray(iYear),400) == 0) 
            dayPerYearArray(iYear,1) = 366;
        else
            dayPerYearArray(iYear,1) = 365;
        end
    end
else
    error('年份输入错误');
end

%% 计算day/month
if(month == 1)
    dayPerMonthArray = 0;
elseif (month > 1 && month <= 12)
    if(( rem(year,100) ~= 0 && rem(year,4) == 0 ) || rem(year,400) == 0) 
        dayPerMonthArray = (monthArrayLeapYear(1:month-1,1));
    else
        dayPerMonthArray = (monthArrayOrdiYear(1:month-1,1));
    end
else
    error('月份输入错误');
end
    
%% 计算儒略日
JdDay = sum(dayPerYearArray) + sum(dayPerMonthArray) + day ;


