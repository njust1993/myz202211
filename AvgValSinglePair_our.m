function [] = AvgValSinglePair_our(a,c,r,s, p, q, count)
sum_time = 0;  
sum_AvgDiff = 0;
sum_max_men = 0;

for j =1:count

% fprintf('# of p = %d;  # of q = %d;  # j = %d\n', p, q, j); 
% fprintf('# of j = %d\n', j);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  Single Pair(p,q)    
%%%%%%%    1)time; 2)error; 3)avgdiff 4) Memory
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

[Total_time_SP_our, AvgDiff_SP_our, max_men_SP_our] = SinglePair_our(a, c, r, p(j), q(j), s );   %%%%%%%% the main function

 sum_time = sum_time + Total_time_SP_our;
 sum_AvgDiff = sum_AvgDiff+ AvgDiff_SP_our;
 sum_max_men = sum_max_men + max_men_SP_our;
end

mean_time = sum_time/count;
mean_AvgDiff = sum_AvgDiff/count;
mean_max_men = sum_max_men/count;
% fprintf('> Print Single Pair Similarity mean value \n  ');
fprintf('>  Algorithm 3(SinglePair_our): Optimized versive of N_Sim by SVD-decomposition      : meanTime: %f s;  meanUsage: %d MB;  meanAvgDiff: %f\n ', mean_time, mean_max_men, mean_AvgDiff);
end

