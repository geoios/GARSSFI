function [svp] = munk(depth,par)
%% 函数说明
%功能：munk模型实现
%输入：+depth 深度
%输出：+par 参数

%% 功能代码
    %参数配置
    epsilon = par(1);%0.00737;%%扰动系数 
    v_a = par(2);%声道轴声速
    B = par(3);%归一化尺度1000
    z_a = par(4);%300
    %典型参数配置
%     epsilon = 0.00737;%扰动系数 
%     v_a = 1500;%声道轴声速
%     z_a = 1300;%声道轴深度1000
%     B = 1300;%归一化尺度1000
    %计算公式
    eta = 2 * (depth - z_a) / B;%归一化深度
    soundSpeed = v_a * (1 + epsilon*( exp(-eta)+eta-1) );
    svp(:,1) = depth;
    svp(:,2) = soundSpeed;
end
