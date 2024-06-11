function [PosiResu] = compTranPosiResu_joinEsti(ModelPar0,ConsSett,IniInfo,ObsInfo)
%% ����˵��
%���ܣ�����Ӧ���������߸��ٶ�λ
%% ���ܴ���
%����׼��
    %��������
        %svpGrad = PFGrad_Li(SvpInfo,2,1);
    %�۲���ȡ
    statName = str2num(IniInfo.statName(:,2:end));
    sSess = inf;
    lLine = inf;
    mStat = statName;
        %index = matcInde(sSess,lLine,mStat,ObsInfo);
    ObsData = ObsInfo;%(index,:);
    statCoorX0 = IniInfo.statCoor(:,:);
    %תNEU����v1�汾����ȼۣ�
        % ObsData.tranEnu0 = [ObsData.tranEnu0(:,2) ObsData.tranEnu0(:,1) ObsData.tranEnu0(:,3)];
        % ObsData.tranEnu1 = [ObsData.tranEnu1(:,2) ObsData.tranEnu1(:,1) ObsData.tranEnu1(:,3)];
        % statCoorX0 = [statCoorX0(:,2) statCoorX0(:,1) statCoorX0(:,3)];
%��������
    maxIter = 20;
    term = 5*10^-3;
    svpParX0 = ModelPar0.p0';
    for iLoop = 1:maxIter
        [e0,e1,t0,t1,incAngle,delayTime,bColu,c0] = rayTrackSomeStat_addPar(ObsData,mStat,statCoorX0,svpParX0,ModelPar0);
        %�ſɱȾ���
        A  = -(e0 + e1);
        B = c0*bColu;
        %�۲�в�
        dL = (delayTime - (t0 + t1)) * c0 ;
        %Ȩ�󣨽����
        P = desiWeit(dL,incAngle);%diag(ones(size(dL,1),1));%
        %��С����
        p = svpParX0;%��������p
        [d,kd0] = consKcd(p,ModelPar0);
        c = eye(ModelPar0.size);
        kc0 = p;
	    fc = ModelPar0.p0';
        fd = ConsSett.fd;
	    Dc = ConsSett.dc;
        Dd = ConsSett.dd;
    
        N = [A'*P*A A'*P*B
             B'*P*A B'*P*B + c'*Dc^(-1)*c + d'*Dd^(-1)*d];
        U = [A'*P*dL
             B'*P*dL  + c'*Dc^(-1)*(fc - kc0) + d'*Dd^(-1)*(fd - kd0)];

        dx = N^(-1)*U;
        %��������
        dStatCoorX0 = (reshape(dx(1:3*size(mStat,1),1),3,size(mStat,1)))';
        statCoorX0 = statCoorX0 + dStatCoorX0;
        svpParX0 = svpParX0 + dx(3*size(mStat,1)+1:end,1);
        %���鵥λȨ�����
        dT = dL/c0;
        sigmaT = sqrt(dT'*P*dT/(size(dT,1)-3));%���鵥λȨ�����
        %�жϽ�ֹ����
        if max((dStatCoorX0(:,1).^2+dStatCoorX0(:,2).^2+dStatCoorX0(:,3).^2).^(1/2)) < term
            disp('�ﵽ��������')
            break;
        end
    end
%תNEU����v1�汾����ȼۣ�
    %PosiResu.tranCoor = [statCoorX0(:,2) statCoorX0(:,1) statCoorX0(:,3)];
%����
PosiResu.tranCoor = statCoorX0;
PosiResu.centCoor = mean(PosiResu.tranCoor);
PosiResu.dL = dL;
PosiResu.incAngle = incAngle;
PosiResu.loop = iLoop;
PosiResu.dx = dx;
PosiResu.sigmaT = sigmaT;
PosiResu.svpModePar = svpParX0;