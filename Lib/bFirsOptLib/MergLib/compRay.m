function [bColu,e1,e2,t1,t2] = compRay(i,ArmLength,SAttitude,RAttitude,SPoints,RPoints,x0_singTrans,PF,ModelPar0)
%% 函数说明
%功能：计算B阵
%% 功能代码
%臂长转换
[STraLoc] = ArmCalibration_Jap(ArmLength(1:3)',SAttitude(i,:),SPoints(i,:));
[RTraLoc] = ArmCalibration_Jap(ArmLength(1:3)',RAttitude(i,:),RPoints(i,:));
%费舍尔信息矩阵
[e1,t1] = RayJac_Num(STraLoc,x0_singTrans(1:3),PF);%发射
[e2,t2] = RayJac_Num(RTraLoc,x0_singTrans(1:3),PF);%接收
%计算偏B
diffx = 10^(-6);%比较有影响，对于速度与结果
for jPar = 1:ModelPar0.size
    pcPar = x0_singTrans(end-ModelPar0.size+1:end)';
    pcPar(jPar,1) = pcPar(jPar,1)+diffx;
    [svp_pc] = svpModelFun(pcPar,ModelPar0);
    svp_pc = PFGrad(svp_pc,2,1);
    [~,t1_pc] = RayJac_Num(STraLoc,x0_singTrans(1:3),svp_pc);%发射
    [~,t2_pc] = RayJac_Num(RTraLoc,x0_singTrans(1:3),svp_pc);%接收
    bColu(:,jPar) = ((t1_pc + t2_pc) - (t1 + t2))/diffx;
end