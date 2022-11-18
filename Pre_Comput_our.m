function [u, gamma,  max_men ] = Pre_Comput_our(a, c, r)

n = size(a,1); 
d = sum(a,1)'; %  d: in-degree vector 
inv_d = spfun(@(x) 1./x, d);
q = a * spdiags(inv_d, 0, n, n)  ;   % q = col_norm(a)
max_men = 0;
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear d inv_d a n;

[v, si, u] = svds(q, r);

% inv_si = spdiags(1./diag(si),0, r, r);
inv_si = inv(si);   % The dimension of si is less than 100 and the method is faster 
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear q si;

theta = v' * u;
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear v

lambda = inv(kron(inv_si, inv_si) - c * kron(theta, theta ));
men = whos;
max_men = max(max_men, sum([men.bytes]));
clear inv_sig theta

ide = eye(r);
gamma = reshape (lambda * ide(:), [r,r]);
men = whos;
max_men = max(max_men, sum([men.bytes]));

end

