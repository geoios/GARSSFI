function [svp] = getParPrif(depth,lat,par)
%% ����˵��
%���ܣ����������Ӧ��������
%���룺
%�����
%% ���ܴ���
%������������
expModelPar = [par(1) par(2) par(3)];% par(4)
[depthTempSalProf] = expModelFun(depth,expModelPar);
%�����Թ���������
svpInfo = [depthTempSalProf repmat(lat,size(depth,1),1)];%MYGIγ��
[svp] = delGrosso(svpInfo);

