function [PosiResu] = compTransPositResu(IniInfo,SvpInfo,ObsInfo)
%% 函数说明
%功能：海底应答器纯声线跟踪定位（enu）
%% 功能代码
%数据准备
    %声速剖面
    svpGrad = PFGrad_Li(SvpInfo,2,1);
    %观测提取
    statName = str2num(IniInfo.statName(:,2:end));
    sSess = inf;
    lLine = inf;
    mStat = statName;
    %index = matcInde(sSess,lLine,mStat,ObsInfo);
    ObsData = ObsInfo;%(index,:);
    statCoorX0 = IniInfo.statCoor(:,:);%全部坐标(1:size(mStat,1))'
%迭代解算
    maxIter = 20;
    term = 5*10^-3;
    for iLoop = 1:maxIter
        [e0,e1,t0,t1,incAngle,delayTime] = rayTrackSomeStat(ObsData,mStat,statCoorX0,svpGrad);
        %雅可比矩阵
        A  = -(e0 + e1);
        %观测残差
        c0 = MeanVel_Li(svpGrad);
        dL = (delayTime - (t0 + t1))*c0;
        %权阵
        P = desiWeit(dL,incAngle);%diag(ones(size(dL,1),1));
        %最小二乘
        N = A'*P*A;
        U = A'*P*dL;
        dx = N^(-1)*U;
        %更新坐标
        dStatCoorX0 = (reshape(dx,3,size(mStat,1)))';
        statCoorX0 = statCoorX0 + dStatCoorX0;
        %后验单位权中误差
        dT = dL/c0;
        sigmaT = sqrt(dT'*P*dT/(size(dT,1)-3));
        %判断截止条件
        if max((dStatCoorX0(:,1).^2+dStatCoorX0(:,2).^2+dStatCoorX0(:,3).^2).^(1/2)) < term
            disp('达到收敛条件')
            break;
        end
    end
%导出
PosiResu.tranCoor = statCoorX0;
PosiResu.centCoor = mean(statCoorX0);
PosiResu.dL = dL;
PosiResu.track = ObsData.tranEnu0;
PosiResu.incAngle = incAngle;
PosiResu.loop = iLoop;
PosiResu.dx = dx;
PosiResu.sigmaT = sigmaT;