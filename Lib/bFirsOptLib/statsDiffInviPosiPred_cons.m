function [StatInfo] = statsDiffProdPosiPred_cons(DiffInvePosi_rayTrack)
%% 函数说明
%功能：不同产品定位精度统计
%% 功能代码
% for i = 1%:size(statName,1)
%     statsPosiErroMean(i,1:3) = mean(DiffProdPurePosi.diffCoor_munk);
%     statsPosiErroMean(i,4:6) = mean(DiffProdPurePosi.diffCoor_biline);
%     statsPosiErroMean(i,7:9) = mean(DiffProdPurePosi.diffCoor_essp);
%     
%     statsPosiErroStd(i,1:3) = std(DiffProdPurePosi.diffCoor_munk);
%     statsPosiErroStd(i,4:6) = std(DiffProdPurePosi.diffCoor_biline);
%     statsPosiErroStd(i,7:9) = std(DiffProdPurePosi.diffCoor_essp);
% end
statsPosiErroMean = [mean(DiffInvePosi_rayTrack.diffCoor_surf0AddBott1_1) mean(DiffInvePosi_rayTrack.diffCoor_surf1AddBott0_1) mean(DiffInvePosi_rayTrack.diffCoor_surf1AddBott1_1)
                     mean(DiffInvePosi_rayTrack.diffCoor_surf0AddBott1_2) mean(DiffInvePosi_rayTrack.diffCoor_surf1AddBott0_2) mean(DiffInvePosi_rayTrack.diffCoor_surf1AddBott1_2)
                     mean(DiffInvePosi_rayTrack.diffCoor_surf0AddBott1_3) mean(DiffInvePosi_rayTrack.diffCoor_surf1AddBott0_3) mean(DiffInvePosi_rayTrack.diffCoor_surf1AddBott1_3)];

statsPosiErroStd = [std(DiffInvePosi_rayTrack.diffCoor_surf0AddBott1_1) std(DiffInvePosi_rayTrack.diffCoor_surf1AddBott0_1) std(DiffInvePosi_rayTrack.diffCoor_surf1AddBott1_1)
                    std(DiffInvePosi_rayTrack.diffCoor_surf0AddBott1_2) std(DiffInvePosi_rayTrack.diffCoor_surf1AddBott0_2) std(DiffInvePosi_rayTrack.diffCoor_surf1AddBott1_2)
                    std(DiffInvePosi_rayTrack.diffCoor_surf0AddBott1_3) std(DiffInvePosi_rayTrack.diffCoor_surf1AddBott0_3) std(DiffInvePosi_rayTrack.diffCoor_surf1AddBott1_3)];

%输出变量%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
StatInfo.statsPosiErroMean = statsPosiErroMean;%[statsPosiErroMean(1) statsPosiErroMean(4) statsPosiErroMean(7) statsPosiErroMean(2) statsPosiErroMean(5) statsPosiErroMean(8) statsPosiErroMean(3) statsPosiErroMean(6) statsPosiErroMean(9)];
StatInfo.statsPosiErroStd = statsPosiErroStd;%[statsPosiErroStd(1) statsPosiErroStd(4) statsPosiErroStd(7) statsPosiErroStd(2) statsPosiErroStd(5) statsPosiErroStd(8) statsPosiErroStd(3) statsPosiErroStd(6) statsPosiErroStd(9)];
