function [] = main_AP_N_Sim(a, c, r, s )
% % % fprintf('>>>>>>>>>  All Pairs: S(*,*); 1) time 2) error 3)avgdiff 4)memory \n ');
  %%%%%% Algorithm 2   Non-Iterative All Pairs SimRank (AP_N_Sim)
n = size(a,1);

if r <= 8 
    AP_N_Sim= tic;
    [s_2, max_men] = all_pairs_N_Sim(a, c, r);
    Time_AP_N_Sim = toc( AP_N_Sim );
    S_2 = full(reshape(s_2,[n,n]));
    AvgDiff_AP_N_Sim = sum(sum(abs(S_2-s)))/(n^2);       %%%  Average Difference(EDBT)
else
    Time_AP_N_Sim = 0;
    AvgDiff_AP_N_Sim = 0;
    max_men = 0;
end
 

 % fprintf('>  # of k = %d\n', k(i));
  fprintf('>  Algorithm 2(AllPairs_N_Sim): Non-Iterative SimRank Algorithm                       : Time: %f s;      Usage: %d MB;      AvgDiff: %f\n ',  Time_AP_N_Sim,  max_men,  AvgDiff_AP_N_Sim);
 
end

