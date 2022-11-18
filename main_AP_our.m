function [] = main_AP_our(a, c, r, s )
%%% fprintf('>>>>>>>>>  All Pairs: S(*,*); 1) time 2) error 3)avgdiff 4)memory \n ');

n = size(a,1);
%%%%%% Algorithm 3   SVD-SR All-pairs SimRank (all_pairs_our)

AP_our = tic;
[s_3, max_men] = all_pairs_our(a, c, r);
Time_AP_our = toc( AP_our );
AvgDiff_AP_our = sum(sum(abs(s_3-s)))/(n^2);       %%% Average Difference

% fprintf('>  # of k = %d\n', k(i));
fprintf('> Algorithm 3(AllPairs_our): Optimized versive of N_Sim by SVD-decomposition         : Time: %f s;      Usage: %d MB;      AvgDiff: %f\n ',  Time_AP_our,  max_men, AvgDiff_AP_our);

end

