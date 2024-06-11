function [svp] = munk(depth,par)
%% ����˵��
%���ܣ�munkģ��ʵ��
%���룺+depth ���
%�����+par ����

%% ���ܴ���
    %��������
    epsilon = par(1);%0.00737;%%�Ŷ�ϵ�� 
    v_a = par(2);%����������
    B = par(3);%��һ���߶�1000
    z_a = par(4);%300
    %���Ͳ�������
%     epsilon = 0.00737;%�Ŷ�ϵ�� 
%     v_a = 1500;%����������
%     z_a = 1300;%���������1000
%     B = 1300;%��һ���߶�1000
    %���㹫ʽ
    eta = 2 * (depth - z_a) / B;%��һ�����
    soundSpeed = v_a * (1 + epsilon*( exp(-eta)+eta-1) );
    svp(:,1) = depth;
    svp(:,2) = soundSpeed;
end
