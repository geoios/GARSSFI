function [TransducerPoint] = armCalibration_SouthSea(armLength,attitude,ConversionPoint)
%% 函数说明
%功能：臂长改正函数：用于将GNSS天线相位坐标转换到换能器坐标(enu)
%% 功能代码
attitude = attitude * (pi/180);
R2 = RotationMatrixR2(attitude(1),attitude(2),attitude(3));

R22 = [R2(2,:);R2(1,:);R2(3,:)];
R222 = [R22(:,2) R22(:,1) R22(:,3)];

TransducerPoint =  (R222 * armLength)' +  ConversionPoint;