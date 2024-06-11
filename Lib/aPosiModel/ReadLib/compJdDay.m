function [JdDay] = compJdDay(year,month,day)
%% ����˵��
%���ܣ���UTCת��Ϊ2000-1-1-00:00��������
%���룺+year ��
%      +month ��
%      +day ��
%�����+JdDay ������

%% ���ܴ���
%��������
yearArray = (2000:1:year-1)';
monthArrayOrdiYear = [31 28 31 30 31 30 31 31 30 31 30 31]';
monthArrayLeapYear = [31 29 31 30 31 30 31 31 30 31 30 31]';

%% ����day/year
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
    error('����������');
end

%% ����day/month
if(month == 1)
    dayPerMonthArray = 0;
elseif (month > 1 && month <= 12)
    if(( rem(year,100) ~= 0 && rem(year,4) == 0 ) || rem(year,400) == 0) 
        dayPerMonthArray = (monthArrayLeapYear(1:month-1,1));
    else
        dayPerMonthArray = (monthArrayOrdiYear(1:month-1,1));
    end
else
    error('�·��������');
end
    
%% ����������
JdDay = sum(dayPerYearArray) + sum(dayPerMonthArray) + day ;


