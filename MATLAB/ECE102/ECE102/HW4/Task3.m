iter = 0;
for N = [10, 50, 100] % Loop through all values of N
    iter = iter + 1; % update number of N’s
    n1 = -N:1:-1; n2 = 1:1:N;
    T0 = 3; omega0 = (2*pi)/T0;
    k = n1; cneg = (1/T0)*(-2+exp(-j*k*omega0)+exp(-j*2*k*omega0))./(-j*k*omega0);
    k = n2; cpos = (1/T0)*(-2+exp(-j*k*omega0)+exp(-j*2*k*omega0))./(-j*k*omega0);
    c0 = 1; ck = [cneg, c0, cpos];
    t = -2.5:0.001:2.5;
    fn = myfs(ck, omega0,t); % Apply function
    subplot(3,1,iter);
    plot(t, fn); xlabel('t (s)'); ylabel(['N=',string(N)]);
    if iter == 1
        title('Problem 1 (a) iii');
    end
end