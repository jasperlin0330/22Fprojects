function fn = myfs(Dn,omega0,t)
% fn = myfs(Dn,omega0,t)
% Evaluates the truncated Fourier Series at times t
% Dn -- vector of Fourier series coefficients
% assumed to run from -N:N, where length(Dn) is 2N+1
% omega0 -- fundamental frequency
% t -- vector of times for evaluation
% fn -- truncated Fourier series evaluated at t
N = (length(Dn)-1)/2;
fn = zeros(size(t));
for n = -N:N
D_n = Dn(n+N+1);
fn = fn + D_n*exp(j*omega0*n*t);
end