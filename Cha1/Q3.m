clc;

% 1
sum = single(0);
n = 1;
prev = single(-1);
while sum~=prev
    prev = sum;
    sum = sum+single(1/n);
    n = n+1;
end
n = n-1;
n
sum1 = sum;

% 2
sum = double(0);
for i = [1:1:n]
    sum = sum + double(1/i);
end

double(sum1) - sum
(double(sum1)-sum)/double(sum)

% % 3
% tic
% sum = double(0);
% n = 1;
% prev = double(-1);
% while sum~=prev
%     prev = sum;
%     sum = sum+double(1/n);
%     n = n+1;
% end
% n = n-1;
% n
% toc