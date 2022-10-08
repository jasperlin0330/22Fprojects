subplot(2,1,1);
plot(t,real(y));
xlabel('t(sec)');
ylabel('Real part of y(t)');

subplot(2,1,2);
plot(t,imag(y));
xlabel('t(sec)');
ylabel('Imaginary part of y(t)');
