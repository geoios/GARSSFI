function [k] = compK_essp(depth,par)
%% 函数说明
%功能：计算斜率
%% 功能代码
T0 = par(1); 
deltaT = par(2);
u0 = par(3);

k = deltaT*exp(-depth/u0)*(-1)*(1/u0);