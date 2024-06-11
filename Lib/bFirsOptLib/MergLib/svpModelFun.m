function [svp] = svpModelFun(par,SvpModelSett)
%% 函数说明
%功能：不同SVP模型函数
%% 功能代码
depth = SvpModelSett.depth;
modeType = SvpModelSett.modeType;

if(strcmp(modeType,'Munk'))
    svp = munk(depth,par);
elseif(strcmp(modeType,'Bilinear'))
    svp = biline(depth,par);
elseif(strcmp(modeType,'Essp'))
    lat = SvpModelSett.lat;
    svp = getParPrif(depth,lat,par);
elseif(strcmp(modeType,'Eof'))
    Eof = SvpModelSett.Eof;
    parPar = [par(1);par(2);par(3)];
    svp = [Eof.depth Eof.aver(:,1) + Eof.f(:,1:Eof.pcOrder) * parPar];
end
    
