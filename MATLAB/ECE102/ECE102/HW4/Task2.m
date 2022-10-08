iter = 0;
for N = [10, 50, 100] % Loop through all values of N
    iter = iter + 1; % update number of N’s
    T0 = 1; omega0 = (2*pi)/T0; % Define Period and Angular Frequency
    ck = (1-exp(-2))./(2+2*j*pi*n);
    t = -2.5:0.001:2.5;
    fn = myfs(ck, omega0,t); % Apply function
    subplot(3,1,iter);
    plot(t, fn); xlabel('t(s)'); ylabel(['N =',string(N)]);
    if iter == 1
        title('Problem 1 (a) ii');
    end
end