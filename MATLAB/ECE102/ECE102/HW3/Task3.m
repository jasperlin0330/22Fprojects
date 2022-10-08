t=[-0.5:0.001:0.5];
x=ones(1,length(t));
[y,ty]=nconv(x,t,y,ty);
plot(ty,y);
grid on;
xlabel('t (seconds)')'
ylabel('Convolution of a rect and a triangle')