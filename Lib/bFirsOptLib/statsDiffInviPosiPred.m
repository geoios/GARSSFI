function [PosiErroStat] = statsDiffProdPosiPred(DiffProdPurePosi)
%% 函数说明
%功能：不同产品定位精度统计
%% 功能代码
statsPosiErroMean(1,1:3) = mean(DiffProdPurePosi.diffCoor_munk);
statsPosiErroMean(1,4:6) = mean(DiffProdPurePosi.diffCoor_biline);
statsPosiErroMean(1,7:9) = mean(DiffProdPurePosi.diffCoor_essp);

statsPosiErroStd(1,1:3) = std(DiffProdPurePosi.diffCoor_munk);
statsPosiErroStd(1,4:6) = std(DiffProdPurePosi.diffCoor_biline);
statsPosiErroStd(1,7:9) = std(DiffProdPurePosi.diffCoor_essp);

statsPosiErroRms(1,:) = rms(DiffProdPurePosi.diffCoor_munk);
statsPosiErroRms(1,4:6) = rms(DiffProdPurePosi.diffCoor_biline);
statsPosiErroRms(1,7:9) = rms(DiffProdPurePosi.diffCoor_essp);

statsPosiErroExtr(1,1:3) = [getMaxValue(DiffProdPurePosi.diffCoor_munk(:,1)) getMaxValue(DiffProdPurePosi.diffCoor_munk(:,2)) getMaxValue(DiffProdPurePosi.diffCoor_munk(:,3))];
statsPosiErroExtr(1,4:6) = [getMaxValue(DiffProdPurePosi.diffCoor_biline(:,1)) getMaxValue(DiffProdPurePosi.diffCoor_biline(:,2)) getMaxValue(DiffProdPurePosi.diffCoor_biline(:,3))];
statsPosiErroExtr(1,7:9) = [getMaxValue(DiffProdPurePosi.diffCoor_essp(:,1)) getMaxValue(DiffProdPurePosi.diffCoor_essp(:,2)) getMaxValue(DiffProdPurePosi.diffCoor_essp(:,3))];
%输出变量%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PosiErroStat = [statsPosiErroMean;statsPosiErroStd;statsPosiErroRms;statsPosiErroExtr];
