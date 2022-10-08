% x(t)= cos(2*pi*f_0*t)
% (i) f_0= 3 Hz and f_s= 10 Hz
t = linspace(-1/4,1/4);
x1_0 = cos(2*pi*3*t);
figure(1)
plot(t,x1_0);

hold on
x1_s = cos(2*pi*10*t);
plot(t,x1_s)
hold off

grid on;
title('Part (i) Plots of x(t)= cos(2\pif_0t) and its Sampled Version');
xlabel('t (seconds)');
ylabel('x(t)= cos(2\pif_0t)');
legend('f_0= 3 Hz','f_s= 10 Hz')



% (ii) f_0= 7 Hz and f_s= 10 Hz
t = linspace(-1/4,1/4);
x2_0 = cos(2*pi*7*t);
figure(2)
plot(t,x2_0);

hold on
x2_s = cos(2*pi*10*t);
plot(t,x2_s)
hold off

grid on;
title('Part (ii) Plots of x(t)= cos(2\pif_0t) and its Sampled Version');
xlabel('t (seconds)');
ylabel('x(t)= cos(2\pif_0t)');
legend('f_0= 7 Hz','f_s= 10 Hz')



% (iii) f_0= 13 Hz and f_s= 10 Hz
t = linspace(-1/4,1/4);
x3_0 = cos(2*pi*13*t);
figure(3)
plot(t,x3_0);

hold on
x3_s = cos(2*pi*10*t);
plot(t,x3_s)
hold off

grid on;
title('Part (iii) Plots of x(t)= cos(2\pif_0t) and its Sampled Version');
xlabel('t (seconds)');
ylabel('x(t)= cos(2\pif_0t)');
legend('f_0= 13 Hz','f_s= 10 Hz')
