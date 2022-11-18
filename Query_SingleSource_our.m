function [s, max_men2] = Query_SingleSource_our( q, c, u, gamma, max_men2 )

n = size(u,1); 
x = u * gamma;
men = whos;
max_men2 = max(max_men2, sum([men.bytes]));
clear gamma

ide = speye(n);
s = (1-c)* (ide(:,q) + c * x * u(q,:)'); 
men = whos;
max_men2 = max(max_men2, sum([men.bytes]));
max_men2 = max_men2/(1024^2);
end
