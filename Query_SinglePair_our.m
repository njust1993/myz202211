function [s,max_men] = Query_SinglePair_our(p, q, c, u, gamma, max_men)

n = size(u,1);
x = u(p,:) * gamma;
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear gamma

ide = speye(n);
s = (1-c)* (ide(p,q) + c * x * u(q,:)'); 
men = whos;
max_men = max(max_men, sum([men.bytes]));
max_men = max_men/(1024^2);
end

