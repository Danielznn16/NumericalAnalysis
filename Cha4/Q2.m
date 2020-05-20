clc;


for eps=[1,0.1,0.01,0.0001]
    fprintf("eps: %f\n",eps);
    a = 1/2;
    n = 100;
    % f(x) = (1-a)/(1-exp(-1/eps))*(1-exp(-x/eps))+a*x;
    actuall = (1-a)/(1-exp(-1/eps))*(1-exp(-[1/n:1/n:1]/eps))+a*[1/n:1/n:1];
    actuall = actuall.';
    h = 1/n;

    A = zeros(n,n);

    for i=[1:1:n]
        A(i,i) = -(2*eps+h);
    end
    for i=[1:1:n-1]
        A(i,i+1) = eps+h;
        A(i+1,i) = eps;
    end

    b = ones(n,1)*(a*h^2);
    b(n) = b(n)-eps-h;

    trans = A + (2*eps+h)*eye(n);

    % Jacobi
    y = ones(n,1)*0;
    y_prev = ones(n,1)*1;
    while sum(abs(y_prev-y))>0.0001
        y_prev = y;
        y = (trans*y-b)/(2*eps+h);
    end

    y_jacobi = y;
    fprintf("Jacobi:\nrelative error:\t%f\n",mean(abs((y_jacobi-actuall)./actuall)));


    % G-S
    y = ones(n,1)*0;
    y_prev = ones(n,1)*1;
    while sum(abs(y_prev-y))>0.0001
        y_prev = y;
        for i=[1:1:n]
            tmp = ((trans*y-b)/(2*eps+h));
            y(i) = tmp(i);
        end
    end

    y_gs = y;
    fprintf("GS:\nrelative error:\t%f\n",mean(abs((y_gs-actuall)./actuall)));

    % SOR
    y = ones(n,1)*0;
    y_prev = ones(n,1)*1;
    omega = 0.7;
    while sum(abs(y_prev-y))>0.0001
        y_prev = y;
        for i=[1:1:n]
            tmp = ((trans*y-b)/(2*eps+h));
            y(i) = y(i)*(1-omega)+omega*tmp(i);
        end
    end

    y_sor = y;
    fprintf("SOR:\nrelative error:\t%f\n",mean(abs((y_sor-actuall)./actuall)));

end