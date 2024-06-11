function [svp] = delGrosso(SvpInfo)
%% 函数说明
%功能：delGrosso计算经验公式
%输入：+SvpInfo 剖面信息
%输出：+svp 剖面
%% 功能代码
    for i = size(SvpInfo)
        D = SvpInfo(:,1);
        T = SvpInfo(:,2);%摄氏度[0 40]
        S = SvpInfo(:,3);%ppt[0 40]
        lat = SvpInfo(:,4);
        P = compPress(lat,D);%kg/cm2[0 1000]
        %公式
        C000 = 1402.392;             Ctp = 0.6353509*10^(-2);
        Ct1 = 0.5012285*10^1;        Ct2p2 = 0.2656174*10^(-7);
        Ct2 = -0.551184*10^(-1);     Ctp2 = -0.1593895*10^(-5);
        Ct3 = 0.221649*10^(-3);      Ctp3 = 0.5222483*10^(-9);
        Cs1 = 0.1329530*10^1;        Ct3p = -0.4383615*10^(-6);
        Cs2 = 0.1288598*10^(-3);     Cs2p2 = -0.1616745*10^(-8);
        Cp1 = 0.1560592;             Cst2 = 0.9688441*10^(-4);
        Cp2 = 0.2449993*10^(-4);     Cs2tp = 0.4857614*10^(-5);
        Cp3 = -0.8833959*10^(-8);    Cstp = -0.3406824*10^(-3);
        Cst = -0.1275936*10^(-1);
        Vt = Ct1*T + Ct2*T.^2 + Ct3*T.^3;
        Vs = Cs1*S + Cs2*S.^2;
        Vp = Cp1*P + Cp2*P.^2 + Cp3*P.^3;
        Vstp = Ctp*T.*P + Ct3p*T.^3.*P + Ctp2*T.*P.^2 ...
               + Ct2p2*T.^2.*P.^2 + Ctp3*T.*P.^3+Cst*S.*T ...
               + Cst2*S.*T.^2 + Cstp*S.*T.*P + Cs2tp*S.^2.*T.*P + Cs2p2*S.^2.*P.^2;
        %生成剖面
        svp(:,2) = C000+Vt+Vs+Vp+Vstp;
        svp(:,1) = D;
    end
    
    %% 辅助函数
    function [press] = compPress(lat,depth)
        %%函数说明
        %功能：Leroy公式计算压力
        %输入：+lat 纬度
        %      +depth 深度
        %输出：+press 压力kg/cm^2
        %%功能代码
        press_dbar = 1.0052405*(1+5.28*10^(-3)*sin(lat).^2).*depth + 2.36*10^(-6)*depth.^2;
        press = press_dbar*0.1*1.02;
    end
end


