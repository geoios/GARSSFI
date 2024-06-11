function [e0,e1,t0,t1,incAngle,delayTime,bColu,c0] = rayTrackSomeStat_addPar(ObsData,mStat,statCoorX0,svpParX0,ModelPar0)
%% ����˵��
%���ܣ���վ�۲�����߸���
%% ���ܴ���
e0 = []; t0 = []; incAngle = [];
e1 = []; t1 = [];
delayTime = [];
bColu = [];

[svpInfo] = svpModelFun(svpParX0,ModelPar0);%Add
svpGrad = PFGrad_Li(svpInfo,2,1);%Add
%plotProf_allProf(svpGrad(:,1:2),'k-','��������');hold on;
for iStat = 1:size(mStat,1)
    index_stat = matcInde(inf,inf,mStat(iStat),ObsData);
    sTraLoc = ObsData.tranEnu0(index_stat,:);
    rTraLoc = ObsData.tranEnu1(index_stat,:);
    for iEpoch = 1:size(sTraLoc,1)
        [e0Temp(iEpoch,:),t0Temp(iEpoch,:),incAngleTemp(iEpoch,:)] = RayJac_Num_Li(sTraLoc(iEpoch,:),statCoorX0(iStat,:),svpGrad);%���� 
        [e1Temp(iEpoch,:),t1Temp(iEpoch,:)] = RayJac_Num_Li(rTraLoc(iEpoch,:),statCoorX0(iStat,:),svpGrad);%����

        %���Ӳ�������
        diffx = 10^(-6);%���ڼ����ٶ�������Ӱ��
        parSize = size(svpParX0,1);
        for jPar = 1:parSize
            iterPar = svpParX0;
            iterPar(jPar,1) = iterPar(jPar,1) + diffx;
            
            svp_iter = svpModelFun(iterPar,ModelPar0);
            svp_iter = PFGrad_Li(svp_iter,2,1);
            
            [~,t0_pc(iEpoch,:)] = RayJac_Num_Li(sTraLoc(iEpoch,:),statCoorX0(iStat,:),svp_iter);%���� 
            [~,t1_pc(iEpoch,:)] = RayJac_Num_Li(rTraLoc(iEpoch,:),statCoorX0(iStat,:),svp_iter);%����

            bTemp(iEpoch,jPar) = ((t0_pc(iEpoch,:) + t1_pc(iEpoch,:)) - (t0Temp(iEpoch,:) + t1Temp(iEpoch,:)))/diffx;
        end
    end
    %�ۼӼ���
    e0 = blkdiag(e0,e0Temp);
    e1 = blkdiag(e1,e1Temp);
    t0 = [t0;t0Temp];
    t1 = [t1;t1Temp];
    incAngle = [incAngle;incAngleTemp];
    delayTime = [delayTime;ObsData.TT(index_stat,:);];
    bColu = [bColu;bTemp];
    clear e0Temp t0Temp incAngle0Temp e1Temp t1Temp bTemp
end
c0 = MeanVel_Li(svpGrad);
