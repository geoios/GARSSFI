function [maxErro,index] = getMaxValue(errorData)
%% ����˵��
%���ܣ���ֵ
%% ���ܴ���
    absErroData = abs(errorData);
    maxValu = max(absErroData);
    index = find(absErroData == maxValu);
    maxErro = errorData(index(1));
end
