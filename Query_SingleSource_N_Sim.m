function [s_j, max_men1] = Query_SingleSource_N_Sim(j, c, K_u, lambda, V_r, max_men1)

n = sqrt(size(K_u,1));
s_j =zeros(n,1); 
ide = speye(n);
for i =1:n
    
V_l = K_u((i-1) * n + j,:) * lambda;
s_j(i,1) = (1-c)*(ide(i,j)+ c * V_l * V_r);
men = whos;
max_men1 = max(max_men1,sum([men.bytes]));

end
max_men1 = max_men1/(1024^2);

end

