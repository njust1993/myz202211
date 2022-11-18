function [Total_time_SP_our, AvgDiff_SP_our, max_men_SP_our] =  SinglePair_our(a, c, r, p, q, s  )
% % %  fprintf('>>>>>>>>>  Single Pair: S(p,q); 1) time 2) error 3)avgdiff 4)memory \n ');

    
%%%%%%%%%%% Algorithm3: SVD-SR Single-pair SimRank (SVD_SP_SR)
%%%% Part1: Pre-computation SVD_SP_SR
  Pre_SP_our = tic;  
  [u, gamma,  max_men_our ] = Pre_Comput_our(a, c, r);
  time_Pre_SP_our = toc(Pre_SP_our );
  %%%%%%
  
%%%% Part2:     Query Processing output:the similarity between node p and q;
 Query_SP_our = tic;
 [s_3, max_men_SP_our] = Query_SinglePair_our(p, q, c, u, gamma, max_men_our );
 time_Query_SP_our = toc(Query_SP_our);
 Total_time_SP_our = time_Pre_SP_our + time_Query_SP_our;
 AvgDiff_SP_our = sum(sum(abs(s_3-s(p,q))))/(size(p,2)*size(q,2)); 
 

%  fprintf(' # of k = %d\n', k);
%  fprintf('>  Algorithm 3(OurMethod): Optimized versive of N_Sim by SVD-decomposition(SVD_SP_SR)  : Time: %f s;    AvgDiff: %f;  Usage: %d MB\n ', Total_time_SP_our, AvgDiff_SP_our, max_men_SP_our);
%  fprintf('>  \n\n ');
end

