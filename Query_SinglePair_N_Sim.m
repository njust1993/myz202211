function [s_ij, max_men1] = Query_SinglePair_N_Sim(i, j, c, K_u, lambda, V_r, max_men1)

n = sqrt(size(K_u, 1));
V_l = K_u((i-1) * n + j,:) * lambda;
men = whos;
max_men1 = max(max_men1, sum([men.bytes]));
clear K_u lambda
ide = speye(n);
s_ij = (1-c)*(ide(i,j)+ c * V_l * V_r);
men = whos;
max_men1 = max(max_men1, sum([men.bytes]));
max_men1 = max_men1/(1024^2);

end

