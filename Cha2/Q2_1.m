clc;
syms y;
f1(y) = y^3-y-1;
x0 = 0.6;
x = x0;
lambda = 1;
x_prev = -1;
f1d = diff(f1);
k = 1;
x_h = [];
x_h(1) = x;
while abs(x_prev-x)>0.000000000001
    s = f1(x)/f1d(x);
    x_prev = x;
    x = x - s;
    i = 0;
    while (abs(f1(x))>=abs(f1(x_prev)))
        i = i+1;
        x = x_prev - s*lambda/(2^i);
    end
    k = k+1;
    x_h(k) = x;
    fprintf("%d: %.24e %f\n",k-1,x,lambda/(2^i));
end
% plot([1:1:k],x_h,[1:1:k],f1(x_h));
fz = fzero(@f1_,x0);
fprintf("mine: %.24e \nfzero:%.24e \nrelative error: %e\n",x,fz,abs(x-fz)/fz);
fprintf("f(x_sol):\nmine: %e\nfzero:%e\n",f1(x),f1(fz))