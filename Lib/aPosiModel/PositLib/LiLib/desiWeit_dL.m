function [dL_igg3] = desiWeit_dL(dL)
%% ����˵��
%���ܣ����Ȩ��
%% ���ܴ���
%����Ƕ�Ȩ
P_angl = ones(size(dL,1),1);
%����
robK1 = 3;
robK2 = 4;
sig = VarEst(dL,1,'Med');
for j = 1:size(dL,1)
    P_anglIgg3(j,1)  = P_angl(j);% * IGG3_w(robK1,robK2,dL(j)/sig);
end
%����Ȩ��
dL_igg3 = dL.*P_anglIgg3;
