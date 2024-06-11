function [PosiResu] = compTransPositResu(IniInfo,SvpInfo,ObsInfo)
%% ����˵��
%���ܣ�����Ӧ���������߸��ٶ�λ��enu��
%% ���ܴ���
%����׼��
    %��������
    svpGrad = PFGrad_Li(SvpInfo,2,1);
    %�۲���ȡ
    statName = str2num(IniInfo.statName(:,2:end));
    sSess = inf;
    lLine = inf;
    mStat = statName;
    %index = matcInde(sSess,lLine,mStat,ObsInfo);
    ObsData = ObsInfo;%(index,:);
    statCoorX0 = IniInfo.statCoor(:,:);%ȫ������(1:size(mStat,1))'
%��������
    maxIter = 20;
    term = 5*10^-3;
    for iLoop = 1:maxIter
        [e0,e1,t0,t1,incAngle,delayTime] = rayTrackSomeStat(ObsData,mStat,statCoorX0,svpGrad);
        %�ſɱȾ���
        A  = -(e0 + e1);
        %�۲�в�
        c0 = MeanVel_Li(svpGrad);
        dL = (delayTime - (t0 + t1))*c0;
        %Ȩ��
        P = desiWeit(dL,incAngle);%diag(ones(size(dL,1),1));
        %��С����
        N = A'*P*A;
        U = A'*P*dL;
        dx = N^(-1)*U;
        %��������
        dStatCoorX0 = (reshape(dx,3,size(mStat,1)))';
        statCoorX0 = statCoorX0 + dStatCoorX0;
        %���鵥λȨ�����
        dT = dL/c0;
        sigmaT = sqrt(dT'*P*dT/(size(dT,1)-3));
        %�жϽ�ֹ����
        if max((dStatCoorX0(:,1).^2+dStatCoorX0(:,2).^2+dStatCoorX0(:,3).^2).^(1/2)) < term
            disp('�ﵽ��������')
            break;
        end
    end
%����
PosiResu.tranCoor = statCoorX0;
PosiResu.centCoor = mean(statCoorX0);
PosiResu.dL = dL;
PosiResu.track = ObsData.tranEnu0;
PosiResu.incAngle = incAngle;
PosiResu.loop = iLoop;
PosiResu.dx = dx;
PosiResu.sigmaT = sigmaT;