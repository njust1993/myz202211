function  [Total_time_SS_our, AvgDiff_SS_our, max_men_SS_our]= SingleSource_our(a, c, r, s, q)
% % % fprintf('>>>>>>>>>  Single Source: S(:,q); 1) time 2) error 3)avgdiff 4)memory\n ');
n = size(a,1);

     
    
%%%%%%%%%%% Algorithm4: SVD-SR Single Source SimRank (SVD_SS_SR)
%%%% Part1: Pre-computation SVD_SS_SR

  Pre_SS_our = tic;  
  [u, gamma,  max_men3 ] = Pre_Comput_our(a, c, r);   %% The preprocessing for the single-source case is the same as the preprocessing for the single-pair case, where we call directly
  time_Pre_SS_our = toc( Pre_SS_our );
  %%%%%%
  
%%%% Part2:     Query Processing output:the similarity between node i and j;
 Query_SS_our = tic;
 [S_ss, max_men_SS_our] = Query_SingleSource_our( q, c, u, gamma, max_men3 );
 time_Query_SS_our = toc( Query_SS_our);
 Total_time_SS_our = time_Pre_SS_our + time_Query_SS_our; 
 AvgDiff_SS_our = sum(sum(abs(S_ss - s(:,q))))/n; 

% fprintf('>  Algorithm 3(OurMethod): Optimized versive of N_Sim by SVD-decomposition(SVD_SS_SR)  : Time: %f s;   Error: %f ;   AvgDiff: %f;  Usage: %d MB\n ', All_time_SS3,    Err_SS3,  AvgDiff_SS3, max_men_SS_3);


end

