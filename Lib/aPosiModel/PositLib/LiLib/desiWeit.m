function [P] = desiWeit(dL,incAngle)
%% ����˵��
%���ܣ����Ȩ��
%% ���ܴ���
%����Ƕ�Ȩ
P_angl = ones(size(dL,1),1);%cos(incAngle);
%����
robK1 = 3;
robK2 = 4;
sig = VarEst_Li(dL,1,'Med');
for j = 1:size(dL,1)
    P_anglIgg3(j,1)  = P_angl(j) * IGG3_w_Li(robK1,robK2,dL(j)/sig);
end
%����Ȩ��
P = diag(P_anglIgg3);
