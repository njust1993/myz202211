function [s_2, max_men] =all_pairs_N_Sim(a, c, r) 

n = size(a,1); 
d = sum(a,1)'; %  d: in-degree vector 
inv_d = spfun(@(x) 1./x, d);
q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
max_men = 0;
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear d inv_d a;   

ide = speye(n);
[v, si, u] = svds(q, r);     % w : svd-decomposition
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear w r; 
K_u = kron(u, u);
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear u;
inv_si= inv(si);
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear si;
K_v = kron(v', v');
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear v;
K_vu =  K_v * K_u;
lambda = inv(kron(inv_si, inv_si)-c * K_vu);     
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear K_si  K_vu;
V_r = K_v * ide(:);
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear K_v
p = K_u * lambda;
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear K_u lambda;
s_2 = (1-c)*(ide(:)+c * p * V_r);
% S_2 = full(reshape(s_2,[n,n]));
men = whos;
max_men = max(max_men, sum([men.bytes]));
max_men = max_men/(1024^2);
end

