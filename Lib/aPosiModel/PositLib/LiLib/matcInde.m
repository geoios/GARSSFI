function [inde] = matcInde(S,L,M,ObsTableInfo)
%% 函数说明
%功能：获取符合条件的索引
%% 功能代码
%表
set = cell2mat(ObsTableInfo.SET);
ln = cell2mat(ObsTableInfo.LN);
mt = cell2mat(ObsTableInfo.MT);
setLnMt = [str2num(set(:,2:end)) str2num(ln(:,2:end)) str2num(mt(:,2:end))];
%唯一SLM
allS =  unique(setLnMt(:,1));
allL =  unique(setLnMt(:,2));
allM =  unique(setLnMt(:,3));

if(S == inf)
    S = allS;
end
if(L == inf)
    L = allL;
end
if(M == inf)
    M = allM;
end

inde = []; 
for i = 1:size(S,1)
    for j = 1:size(L,1)
        for k = 1:size(M,1)
            indeTemp = find(setLnMt(:,1) == S(i) & setLnMt(:,2) == L(j) & setLnMt(:,3) == M(k));
            inde = [inde;indeTemp];
        end
    end
end

