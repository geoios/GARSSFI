function [d,kd0] = consKcd(p,ModelPar0)
%% ����˵��
%���ܣ������б��Լ��d/kd0
%% ���ܴ���
depth_surf = 0;
depth_bott = ModelPar0.depth(end,1);
modeType = ModelPar0.modeType;

if(strcmp(modeType,'Munk'))
    yita_surf = 2*(depth_surf-p(4))/p(3);
    yita_bott = 2*(depth_bott-p(4))/p(3);
    d = [p(2)*(exp(-yita_surf)+yita_surf-1) 1+p(1)*(exp(-yita_surf)+yita_surf-1) p(2)*p(1)*(-exp(-yita_surf)+1)*(-2*(depth_surf-p(4))/p(3)^2) p(2)*p(1)*(-exp(-yita_surf)+1)*(-2/p(3))%��������
         p(2)*(exp(-yita_bott)+yita_bott-1) 1+p(1)*(exp(-yita_bott)+yita_bott-1) p(2)*p(1)*(-exp(-yita_bott)+1)*(-2*(depth_bott-p(4))/p(3)^2) p(2)*p(1)*(-exp(-yita_bott)+1)*(-2/p(3))%��������Լ��
         p(2)*(-exp(-yita_bott)+1)*2/p(3) p(1)*(-exp(-yita_bott)+1)*2/p(3) (p(2)*p(1)*(-exp(-yita_bott))*(2*(depth_bott-p(4)))*(p(3)^(-2)))*2/p(3)+p(2)*p(1)*(-exp(-yita_bott)+1)*(-2*p(3)^(-2)) p(2)*p(1)*(2/p(3))^2*(-exp(-yita_bott))];%����б��Լ��
    
    k0_line0 = munk(depth_surf,p);%��������
    k0_line = munk(depth_bott,p);%�����
    k0_line2 = compK_munk(depth_bott,p);%�б��
    
    kd0 = [k0_line0(2);k0_line(2);k0_line2];%
elseif(strcmp(modeType,'Bilinear'))
    d = [1 p(4) (depth_bott-p(4)) p(2)-p(3)];
    
    k0_line = biline(depth_bott,p);%�����
    kd0 = k0_line(2);
elseif(strcmp(modeType,'Essp')) 
    d = [1 exp(-(depth_surf/p(3))) p(2)*exp(-(depth_surf/p(3)))*(depth_surf/p(3)^2)
         1 exp(-(depth_bott/p(3))) p(2)*exp(-(depth_bott/p(3)))*(depth_bott/p(3)^2)
         0 exp(-(depth_bott/p(3)))*(-1/p(3)) p(2)*((exp(-(depth_bott/p(3)))*depth_bott/p(3)^2)*(-1/p(3)) + (exp(-(depth_bott/p(3))))*(1/p(3)^2))];
    
    k0_line0 = expModelFun(depth_surf,p); 
    k0_line = expModelFun(depth_bott,p);%��¶�
    k0_line2 = compK_essp(depth_bott,p);%��¶�б��
    kd0 = [k0_line0(2);k0_line(2);k0_line2];
end
    
