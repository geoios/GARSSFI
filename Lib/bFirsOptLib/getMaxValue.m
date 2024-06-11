function [maxErro,index] = getMaxValue(errorData)
%% 函数说明
%功能：最值
%% 功能代码
    absErroData = abs(errorData);
    maxValu = max(absErroData);
    index = find(absErroData == maxValu);
    maxErro = errorData(index(1));
end
