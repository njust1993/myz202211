function [] = AvgValSingleSource_our(a, c, r, s, q, count)
sum_time = 0;  
sum_AvgDiff = 0;
sum_max_men = 0;


for j =1:count

% fprintf('# of p = %d;  # of q = %d;  # j = %d\n', size(p,2), size(q,2),j);
% fprintf('  # of q = %d;  # j = %d\n',  q, j); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  Single Pair(p,q)    
%%%%%%%    1)time; 2)error; 3)avgdiff 4) Memory
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

[Total_time_SS_our, AvgDiff_SS_our, max_men_SS_our]= SingleSource_our(a, c, r, s, q(j));   %%%%%%%% the main function

 sum_time = sum_time + Total_time_SS_our;
 sum_AvgDiff = sum_AvgDiff + AvgDiff_SS_our;
 sum_max_men = sum_max_men + max_men_SS_our;
end

mean_time = sum_time/count;
mean_AvgDiff = sum_AvgDiff/count;
mean_max_men = sum_max_men/count;

fprintf('>  Algorithm 3 (SingleSource_our): Optimized versive of N_Sim by SVD-decomposition   : meanTime: %f s;  meanUsage: %d MB;  meanAvgDiff: %f\n ', mean_time, mean_max_men, mean_AvgDiff);
end

