function [svp] = biline(depth,par)
%% 函数说明
%功能：双线性函数
%% 功能代码
    zb = par(4);
    svp(:,1) = depth;
    for i = 1:size(depth,1)
        svp(i,2) = bilineSub(depth(i,1),par,zb);
    end
    %% 辅助函数
    function c = bilineSub(depthLine,par,zb)
        cs = par(1);%海面声速
        g1 = par(2);
        g2 = par(3);
        if(depthLine <= zb)
            c = cs + g1*depthLine;
        else
            cb = cs + g1*zb;
            c = cb + g2*(depthLine-zb);
        end
    end
end
