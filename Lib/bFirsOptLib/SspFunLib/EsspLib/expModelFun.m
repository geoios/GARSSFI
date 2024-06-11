function [tempSalprof] = expModelFun(depth,opt)
%% 函数说明
%功能：指数模型函数
%输入：+depth 深度
%      +opt 模型参数
%输出：+tempSalprof 温盐剖面

%% 功能代码
%参数配置
T0 = opt(1);
deltaT = opt(2);
u0 = opt(3);
%r = opt(4);
%函数模型
tempProf = T0 + deltaT .* exp(-(depth/u0));
salProf = repmat(35,size(depth,1),1);
tempSalprof = [depth tempProf salProf];
