function [tempSalprof] = expModelFun(depth,opt)
%% ����˵��
%���ܣ�ָ��ģ�ͺ���
%���룺+depth ���
%      +opt ģ�Ͳ���
%�����+tempSalprof ��������

%% ���ܴ���
%��������
T0 = opt(1);
deltaT = opt(2);
u0 = opt(3);
%r = opt(4);
%����ģ��
tempProf = T0 + deltaT .* exp(-(depth/u0));
salProf = repmat(35,size(depth,1),1);
tempSalprof = [depth tempProf salProf];
