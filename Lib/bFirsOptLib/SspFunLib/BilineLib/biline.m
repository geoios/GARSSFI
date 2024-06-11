function [svp] = biline(depth,par)
%% ����˵��
%���ܣ�˫���Ժ���
%% ���ܴ���
    zb = par(4);
    svp(:,1) = depth;
    for i = 1:size(depth,1)
        svp(i,2) = bilineSub(depth(i,1),par,zb);
    end
    %% ��������
    function c = bilineSub(depthLine,par,zb)
        cs = par(1);%��������
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
