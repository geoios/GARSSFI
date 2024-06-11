function [TransducerPoint] = armCalibration_Japan(ArmLength,Attitude,ConversionPoint)
% Attitude = Attitude * (pi/180);
% R2 = RotationMatrixR2_Jap(Attitude(1),Attitude(2),Attitude(3));

%杨臂长转换
% TransformPar    =  (R2 * ArmLength)';
% TransformPar(3) = TransformPar(3) * -1;
% TransducerPoint = TransformPar + ConversionPoint;
%肖臂长准换
[pole_de,pole_dn,pole_du] = Transform(Attitude(1),Attitude(2),Attitude(3),ArmLength(1),ArmLength(2),ArmLength(3));
TransducerPoint = [pole_de pole_dn pole_du] + ConversionPoint;

    %% 辅助函数
    function [ pole_de,pole_dn,pole_du ] = Transform( Heading,Pitch,Roll,Forward,Rightward,Downward )
    %%函数说明
    %功能：肖臂长转换
    %%功能代码
    yw=Heading*pi/180;
    rl=Roll*pi/180;
    pc=Pitch*pi/180;
    
    crl=cos(rl);srl=sin(rl);
    cpc=cos(pc);spc=sin(pc);
    cyw=cos(yw);syw=sin(yw);
    
    tr_rl=[1,0,0;0,crl,-srl;0,srl,crl];
    tr_pc=[cpc,0,spc;0,1,0;-spc,0,cpc];
    tr_yw=[cyw,-syw,0;syw,cyw,0;0,0,1];
    
    trans=tr_yw*tr_pc*tr_rl;
    atd=[Forward,Rightward,Downward];
    dned=trans*atd';
    
    pole_de=dned(2);
    pole_dn=dned(1);
    pole_du=-dned(3);