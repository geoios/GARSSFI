function [svp] = getParPrif(depth,lat,par)
%% 函数说明
%功能：计算参数对应声速剖面
%输入：
%输出：
%% 功能代码
%生成温盐剖面
expModelPar = [par(1) par(2) par(3)];% par(4)
[depthTempSalProf] = expModelFun(depth,expModelPar);
%生成自构声速剖面
svpInfo = [depthTempSalProf repmat(lat,size(depth,1),1)];%MYGI纬度
[svp] = delGrosso(svpInfo);

