W = linspace(-3*pi, 3*pi, 1000);

h = @(w) 4 ./ (4 + exp(-1j .* w));

h1 = @(w) 4./ (4 - exp(-1j .* w));

H = arrayfun(h, W);
H1 = arrayfun(h1, W);

figure(1);
clf
hold on
plot(W, abs(H), 'r', 'LineWidth', 2, 'DisplayName', 'FRF from (4)')
plot(W, abs(H1), 'b', 'LineWidth', 2, 'DisplayName', 'FRF from (3)');
legend();
xlabel("Frequency (radians)")
ylabel("Magnitude")