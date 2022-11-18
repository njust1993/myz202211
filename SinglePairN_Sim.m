function [Total_SP_N_Sim, AvgDiff_SP_N_Sim, max_men_SP_N_Sim] = SinglePairN_Sim(a, c, r, p, q, s  )
% % %  fprintf('>>>>>>>>>  Single Pair: S(p,q); 1) time 2) error 3)avgdiff 4)memory \n ');

   
 %%%%%% Algorithm 2: Non-Iterative Single Pair SimRank (N_SP_Sim)SinglePairN_Sim
 %%%% Part1: Pre-computation N_SP_Sim
 if r <= 8
     Pre_SP_N_Sim = tic;  
     [K_u, lambda, V_r,max_men2] = Pre_Comput_N_Sim(a, c,r);
     time_Pre_SP_N_Sim = toc(Pre_SP_N_Sim);

    %%%% Part2:     Query Processing output:the similarity between node set p and q;

     Query_SP_N_Sim = tic;
     [s_2, max_men_SP_N_Sim] = Query_SinglePair_N_Sim(p, q, c, K_u, lambda, V_r, max_men2);
     time_Query_SP_N_Sim = toc(Query_SP_N_Sim);
     Total_SP_N_Sim =  time_Pre_SP_N_Sim + time_Query_SP_N_Sim;
     %%%%%%
     AvgDiff_SP_N_Sim = sum(sum(abs(s_2-s(p,q))));            %%% Partial Pair (Single-pair): Average Difference(EDBT)

 else
     Total_SP_N_Sim  = 0;
     AvgDiff_SP_N_Sim  =0;
     max_men_SP_N_Sim = 0;
 end


%  fprintf(' # of k = %d\n', k);
%  fprintf('>  Algorithm 2(EDBT-2010): Non-Iterative SimRank Algorithm(N_SP_Sim)                   : Time: %f s;  AvgDiff: %f;  Usage: %d MB\n ', Total_SP_N_Sim, AvgDiff_SP_N_Sim, max_men_SP_N_Sim);
%  fprintf('>\n ');
end


