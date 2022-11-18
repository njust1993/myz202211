function [] = AvgValSingleSourceN_Sim(a,c,r, s, q, count)
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

[Total_time_SS_N_Sim, AvgDiff_SS_N_Sim, max_men_N_Sim] = SingleSourceN_Sim(a, c, r, q(j) ,s );   %%%%%%%% the main function
 sum_time =sum_time + Total_time_SS_N_Sim;
 sum_AvgDiff = sum_AvgDiff + AvgDiff_SS_N_Sim;
 sum_max_men = sum_max_men + max_men_N_Sim;
 
end

mean_time = sum_time/count;
mean_AvgDiff = sum_AvgDiff/count;
mean_max_men = sum_max_men/count;

% fprintf('> Print Single Source Similarity mean value  \n');
fprintf('>   Algorithm 2  (SingleSource_N_Sim): Non-Iterative SimRank Algorithm                : meanTime: %f s;  meanUsage: %d MB;  meanAvgDiff: %f\n ', mean_time, mean_max_men, mean_AvgDiff);

end

