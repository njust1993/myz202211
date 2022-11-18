function [s, max_men] = I_Sim_Memory(a, c, kmax)   % s = cw'sw + (1-c)I
%%%%%%  computate the peak amount of memory used by the algorithm to run.
n = size(a,1);
d = sum(a, 1)';                     % d: in-degree   
    max_men = 0;    
inv_d = 1./d;
    men = whos;
    max_men = max(max_men, sum([men.bytes]));
clear d
    men = whos;
    max_men = max(max_men, sum([men.bytes]));
inv_d(isinf(inv_d)) = 0;
w = a * spdiags(inv_d, 0, n, n);     % w = col-norm(a)
    men = whos;
    max_men = max(max_men, sum([men.bytes]));
clear  inv_d a
wt = w';
    men = whos;
    max_men = max(max_men, sum([men.bytes]));
I = eye(n, n);
s = I;

    men = whos;
    max_men = max(max_men, sum([men.bytes]));
clear n

%%%
for i = 1: kmax
    s = c * wt * s * w + (1-c) * I;
    men = whos;
    max_men = max(max_men, sum([men.bytes]));
end

 max_men = max_men/(1024^2);
end

