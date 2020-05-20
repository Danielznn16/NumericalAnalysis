clc;
for n = [8,10,12]
    H = hilb(n);
    x = ones(n,1);
    b = H*x;
    L = chol(H);
    x_hat = (L^-1)*((L.')^-1) * b;
    r = b-H*x_hat;
    x_delta = x_hat-x;
    fprintf("%d:\n",n);
    fprintf("||r||inf: %e\n",norm(r,inf));
    fprintf("||x_delta||inf: %e\n",norm(x_delta,inf));
    
    
    b = b+ones(n,1)*1e-7;
    L = chol(H);
    x_hat = (L^-1)*((L.')^-1) * b;
    r = b-H*x_hat;
    x_delta = x_hat-x;
    fprintf("biased:\n");
    fprintf("||r||inf: %e\n",norm(r,inf));
    fprintf("||x_delta||inf: %e\n",norm(x_delta,inf));
end