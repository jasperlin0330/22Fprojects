% TASK 1
t = -10:0.2:10;
x = exp(-t.^2).*cos(2*pi*t);
plot(t,x);
grid on;
title('Plot of x(t)= e^{-t^2}cos(2\pit)');
xlabel('t (seconds)');
ylabel('x(t)');

%TASK 2
t=-5:0.1:5;
plot(t,relu(t));
grid;
title('Plot of relu(t)');
xlabel('t');
ylabel('relu(t)');

% TASK 3
t= -5:0.1:5;
figure;
plot(t, even(t,@relu));
grid;
title('Even Part of relu(t)');
xlabel('t');
ylabel('Even component of relu(t)');

t= -5:0.1:5;
figure;
plot(t, odd(t, @relu));
grid;
title('Odd Part of relu(t)');
xlabel('t');
ylabel('Odd component of relu(t)');