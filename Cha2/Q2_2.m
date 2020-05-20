clc;
syms y;
f2(y) = -y^3+5*y;
x0 = 1.35;
x = x0;
lambda = 1;
x_prev = -1;
f2d = diff(f2);
k = 1;
x_h = [];
x_h(1) = x;
while abs(x_prev-x)>0.000000000001
    s = f2(x)/f2d(x);
    x_prev = x;
    x = x - s;
    i = 0;
    while (abs(f2(x))>=abs(f2(x_prev)))
        i = i+1;
        x = x_prev - s*lambda/(2^i);
    end
    k = k+1;
    x_h(k) = x;
    fprintf("%d: %.24e %f\n",k-1,x,lambda/(2^i));
end
% plot([1:1:k],x_h,[1:1:k],f2(x_h));
fz = fzero(@f2_,x0);
fprintf("mine: %.24e \nfzero:%.24e \nrelative error: %e\n",x,fz,abs(x-fz)/fz);
fprintf("f(x_sol):\nmine: %e\nfzero:%e\n",f2(x),f2(fz))