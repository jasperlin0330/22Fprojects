t = -10:0.2:10;
x = exp(-t.^2).*cos(2*pi*t);

plot(t,x);
grid on;
title('Plot of x(t)= e^{-t^2}cos(2\pit)');
xlabel('t (seconds)');
ylabel('x(t)');