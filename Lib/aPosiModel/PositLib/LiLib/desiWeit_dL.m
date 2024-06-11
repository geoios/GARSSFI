function [dL_igg3] = desiWeit_dL(dL)
%% 函数说明
%功能：设计权阵
%% 功能代码
%入射角定权
P_angl = ones(size(dL,1),1);
%抗差
robK1 = 3;
robK2 = 4;
sig = VarEst(dL,1,'Med');
for j = 1:size(dL,1)
    P_anglIgg3(j,1)  = P_angl(j);% * IGG3_w(robK1,robK2,dL(j)/sig);
end
%最终权阵
dL_igg3 = dL.*P_anglIgg3;
