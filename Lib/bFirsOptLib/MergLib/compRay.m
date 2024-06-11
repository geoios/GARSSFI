function [bColu,e1,e2,t1,t2] = compRay(i,ArmLength,SAttitude,RAttitude,SPoints,RPoints,x0_singTrans,PF,ModelPar0)
%% ����˵��
%���ܣ�����B��
%% ���ܴ���
%�۳�ת��
[STraLoc] = ArmCalibration_Jap(ArmLength(1:3)',SAttitude(i,:),SPoints(i,:));
[RTraLoc] = ArmCalibration_Jap(ArmLength(1:3)',RAttitude(i,:),RPoints(i,:));
%�������Ϣ����
[e1,t1] = RayJac_Num(STraLoc,x0_singTrans(1:3),PF);%����
[e2,t2] = RayJac_Num(RTraLoc,x0_singTrans(1:3),PF);%����
%����ƫB
diffx = 10^(-6);%�Ƚ���Ӱ�죬�����ٶ�����
for jPar = 1:ModelPar0.size
    pcPar = x0_singTrans(end-ModelPar0.size+1:end)';
    pcPar(jPar,1) = pcPar(jPar,1)+diffx;
    [svp_pc] = svpModelFun(pcPar,ModelPar0);
    svp_pc = PFGrad(svp_pc,2,1);
    [~,t1_pc] = RayJac_Num(STraLoc,x0_singTrans(1:3),svp_pc);%����
    [~,t2_pc] = RayJac_Num(RTraLoc,x0_singTrans(1:3),svp_pc);%����
    bColu(:,jPar) = ((t1_pc + t2_pc) - (t1 + t2))/diffx;
end