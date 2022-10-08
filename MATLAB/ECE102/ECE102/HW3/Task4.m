t=[-0.5:0.001:0.5];
x=ones(1,length(t));
[y,ty]=nconv(x,t,x,t);
N=100-2
for n=1:N
    [y,ty]=nconv(x,t,y,ty);
end
plot(ty,y);
grid on;
xlabel('t (seconds)')'
ylabel('Convolution of N rect functions')