clear all
clc
%%%%  example 2 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 'email-Eu-core';              %% nodes: 1005,   edges: 25571                        % % N_Sim: max(r)=32      SVD_SR: max(r)=213 
% %  'ego-Facebook';               %% nodes: 4039,   edges: 88234                       % % N_Sim: max(r)=8       SVD_SR: max(r)=213 
% %  'ca-GrQc';                    %% nodes: 5,242,  edges:28980                        % % N_Sim: max(r)=4       SVD_SR: max(r)=212 
% %  'as-735';                     %% nodes: 7716,   edges:26467                        % % N_Sim: max(r)=4       SVD_SR: max(r)=210 
% %  ds = 'p2p-Gnutella08';        %% nodes: 6301    edges:20777                        % % N_Sim: max(r)=4       SVD_SR: max(r)=210 
% %  'wiki-Vote';                  %% nodes: 8297,   edges:103689                       % % N_Sim: max(r)=3       SVD_SR: max(r)=210 
% %  'p2p-Gnutella06';             %% nodes: 8717,    edges: 31525                      % % N_Sim: max(r)=3       SVD_SR: max(r)=210 
% %  'ca-HepPh';                   %% nodes: 12008,  edges:237010                       % % N_Sim: max(r)=2       SVD_SR: max(r)=210 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%% 
 % fpath = 'D:\Matlab files\dataset\';
 fpath = 'E:\MATLAB\dataset\';
% %  ds = 'email-Eu-core';                    %% nodes: 1005,   edges: 25571
 ds = 'ego-Facebook';                     %% nodes: 4039,   edges: 88234
% %  ds = 'ca-GrQc';                          %% nodes: 5242,   edges:28980
% %  ds = 'p2p-Gnutella08';                   %% nodes: 6301    edges:20777
% %  ds = 'as-735';                           %% nodes: 7716,   edges:26467   
% %  ds = 'wiki-Vote';                        %% nodes: 8297,    edges: 103689
% %  ds = 'p2p-Gnutella06';                   %% nodes: 8717,    edges: 31525
% %  ds = 'ca-HepPh';                         %% nodes: 12008,  edges:237010

  a = loaddata(fpath, ds);
      
 
%%%% example 3 
%%%%  stochastic matrix
% n = 100;
% a = spones(sprand(n, n, 0.3));

c = 0.8;
n = size(a, 1);
m = nnz(a);

% rr = rank(full(a));
% fprintf('# of nodes = %d;  # of edges = %d;  # of rank = %d\n', n, m, rr);
% fprintf('# of nodes = %d;  # of edges = %d\n', n, m);

 %%%%%% Algorithm 1: Iterative method (baseline):   %%  s = cw'sw + (1-c)I
 ErrorBound = 1.0e-15;
 kmax =  round(log( ErrorBound)/log(c));
 time_Iter = tic;
 [s, max_men] = I_Sim_Memory(a, c, kmax);
 Temp_Iter = toc(time_Iter);
 fprintf('> Algorithm 1: Iterative method of SimRank(I_Sim) (baseline)                          : Time: %f s;   Usage: %d MB\n ',Temp_Iter,  max_men); 
 fprintf('> \n\n');
 
 
r = [2 2^2 2^3 2^4 2^5 2^6, 2^7];      % r can change, r-svd decomposition
count = 100;
p = randperm(size(a,1),count);
q = randperm(size(a,1),count);
 
 for t = 1:size(r,2)
    
fprintf('>>>>>>>>> r = %d;  Similarity Value : S ; 1) time 2)avgdiff 3)memory \n ', r(t));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%% Single Pair s(p,q)
% %%%%%%% 1)time;  2)error;  3)avgdiff;  4)memory
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
AvgValSinglePairN_Sim(a, c, r(t), s, p, q, count);
AvgValSinglePair_our(a, c, r(t), s, p, q, count);
fprintf('> \n');

 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%% Single Source s(:,q)
% %%%%%%% 1)time;  2)error;  3)avgdiff;  4)memory
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% fprintf('>>>>>>>>> k = %d;   Single Source Similarity Mean Value: S(:,q); 1) time 2) error 3)avgdiff 4)memory\n ',k(t)); 
AvgValSingleSourceN_Sim(a,c, r(t),s, q, count)
AvgValSingleSource_our(a,c, r(t),s, q, count)
fprintf('>  \n');


% %  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %  %%%%%%% All Pairs
% %  %%%%%%% time;  error;  avgdiff;  memory
% %  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fprintf('>>>>>>>>> k = %d;   All Pairs: S(*,*); 1) time 2) error 3)avgdiff 4)memory \n ',k(t));
main_AP_N_Sim(a, c, r(t), s );
main_AP_our(a, c, r(t), s );
fprintf('> \n');
 end