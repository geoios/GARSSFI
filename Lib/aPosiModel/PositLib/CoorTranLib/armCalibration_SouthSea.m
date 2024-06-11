function [TransducerPoint] = armCalibration_SouthSea(armLength,attitude,ConversionPoint)
%% ����˵��
%���ܣ��۳��������������ڽ�GNSS������λ����ת��������������(enu)
%% ���ܴ���
attitude = attitude * (pi/180);
R2 = RotationMatrixR2(attitude(1),attitude(2),attitude(3));

R22 = [R2(2,:);R2(1,:);R2(3,:)];
R222 = [R22(:,2) R22(:,1) R22(:,3)];

TransducerPoint =  (R222 * armLength)' +  ConversionPoint;