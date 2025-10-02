clf;
clc;
N = 6;
w_0 = 2 * pi / N;

T = 2 * pi / w_0;
t = linspace(-2*T, 2*T, 1000);

M_list = [8 20 50];
alpha = @(k, n) exp(-1j .* n .* k .* w_0);
ak = @(k) -1/(1j .* 6 .*k .* w_0) .*((alpha(5, k) - alpha(4, k)) - (alpha(2,k) - alpha(1,k)));
figure('Name', 'Partial Fourier Sums');

for p = 1:numel(M_list)

    M = M_list(p);
    k = -M:M;
    aK = arrayfun(ak, k);
    aK(ceil(length(aK)/2)) = 0;
    E = exp(1j * w_0 * (k.'* t));
    x_t = real(aK * E);

    subplot(numel(M_list), 1, p);
    plot(t, x_t, 'LineWidth', 2); grid on;
    xlim([t(1) t(end)]);
    title(sprintf('x_M(t) with M = %d', M));
    xlabel('t'); ylabel('x_M(t)');
end

