t=[1:0.001:2];
f=2*ones(1,length(t));
g=2*(t-1);
[y,ty]=nconv(f,t,g,t);
plot(ty,y);
grid on;
xlabel('t(seconds)')'
ylabel('Output of part 3(a)(i)')