function [k] = compK_munk(depth,par)
%% ����˵��
%���ܣ���k
%% ���ܴ���
    epsilon = par(1);%0.00737;%%�Ŷ�ϵ�� 
    v_a = par(2);%����������
    B = par(3);%��һ���߶�1000
    z_a = par(4);%300;%���������1000 
    
    eta = 2 * (depth - z_a) / B;%��һ�����
    
    k = v_a*epsilon*(-exp(-eta)+1)*2/B;

