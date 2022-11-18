function  [Total_time_SS_N_Sim, AvgDiff_SS_N_Sim, max_men_N_Sim]= SingleSourceN_Sim(a, c, r, q ,s )
% % % fprintf('>>>>>>>>>  Single Source: S(:,q); 1) time 2) error 3)avgdiff 4)memory\n ');
n = size(a,1);

     
 %%%%%% Algorithm 2: Non-Iterative  SimRank (N_SS_Sim)
 %%%% Part1: Pre-computation N_SS_Sim
 if r <= 8
     Pre_SS_N_Sim = tic;  
     [K_u, lambda, V_r,max_men2] = Pre_Comput_N_Sim(a, c,r);    %% The preprocessing for the single-source case is the same as the preprocessing for the single-pair case, where we call directly
     time_Pre_SS_N_Sim = toc(Pre_SS_N_Sim);

%%%% Part2:  Query Processing output:the similarity between node set p and q;
    Query_SS_N_Sim = tic;
    [S_ss, max_men_N_Sim] = Query_SingleSource_N_Sim(q, c, K_u, lambda, V_r, max_men2);
    time_Query_SS_N_Sim = toc(Query_SS_N_Sim);
    Total_time_SS_N_Sim = time_Pre_SS_N_Sim + time_Query_SS_N_Sim;
    AvgDiff_SS_N_Sim = sum(sum(abs(S_ss-s(:,q))))/n;       %%% Partial Pair (Single-pair): Average Difference(EDBT)
 else
   Total_time_SS_N_Sim  = 0;
   AvgDiff_SS_N_Sim  =0;
   max_men_N_Sim = 0;
 end
end

