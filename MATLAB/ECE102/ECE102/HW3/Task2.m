t=[-0.5:0.001:0.5];
x=ones(1,length(t));
[y,ty]=nconv(x,t,x,t);
plot(ty,y);
grid on;
xlabel('t (seconds)')'
ylabel('Convolution of two rect functions')