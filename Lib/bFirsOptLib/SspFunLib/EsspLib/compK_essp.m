function [k] = compK_essp(depth,par)
%% ����˵��
%���ܣ�����б��
%% ���ܴ���
T0 = par(1); 
deltaT = par(2);
u0 = par(3);

k = deltaT*exp(-depth/u0)*(-1)*(1/u0);