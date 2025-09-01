%% Part (c): Apply your functions to the sequence x[n] = sin (pi * n / 20) for
% 0 leq n leq 20 and x[n] = 0

% Building x[n]
n = 0:50;
x = zeros(size(n));
x(n <= 20) = sin(pi * n(n <= 20) / 20); 

y_a = half(x);
n_a = 0:2:50; % for plotting

y_b = twice(x);
n_b = 0:0.5:50; % for plotting
subplot(3,1,1);
plot(n,x);
subplot(3,1,2);
plot(n_a, y_a);
subplot(3,1,3);
plot(n_b, y_b);