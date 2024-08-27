function [e0,e1,t0,t1,incAngle,delayTime] = rayTrackSomeStat(ObsData,mStat,statCoorX0,svpGrad)
%% 函数说明
%功能：单站观测的声线跟踪
%% 功能代码
e0 = []; t0 = []; incAngle = [];
e1 = []; t1 = [];
delayTime = [];
for iStat = 1:size(mStat,1)
    index_stat = matcInde(inf,inf,mStat(iStat),ObsData);
    sTraLoc = ObsData.tranEnu0(index_stat,:);
    rTraLoc = ObsData.tranEnu1(index_stat,:);
    for iEpoch = 1:size(sTraLoc,1)
        [e0Temp(iEpoch,:),t0Temp(iEpoch,:),incAngleTemp(iEpoch,:)] = RayJac_Num_Li(sTraLoc(iEpoch,:),statCoorX0(iStat,:),svpGrad);%发射 
        [e1Temp(iEpoch,:),t1Temp(iEpoch,:)] = RayJac_Num_Li(rTraLoc(iEpoch,:),statCoorX0(iStat,:),svpGrad);%接收
    end
    %累加计算
    e0 = blkdiag(e0,e0Temp);
    e1 = blkdiag(e1,e1Temp);
    t0 = [t0;t0Temp];
    t1 = [t1;t1Temp];
    incAngle = [incAngle;incAngleTemp];
    delayTime = [delayTime;ObsData.TT(index_stat,:);];
    clear e0Temp t0Temp incAngleTemp e1Temp t1Temp
end
