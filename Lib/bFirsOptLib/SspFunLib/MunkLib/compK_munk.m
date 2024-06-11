function [k] = compK_munk(depth,par)
%% 函数说明
%功能：求k
%% 功能代码
    epsilon = par(1);%0.00737;%%扰动系数 
    v_a = par(2);%声道轴声速
    B = par(3);%归一化尺度1000
    z_a = par(4);%300;%声道轴深度1000 
    
    eta = 2 * (depth - z_a) / B;%归一化深度
    
    k = v_a*epsilon*(-exp(-eta)+1)*2/B;

