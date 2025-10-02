clear; close all; clc;
N = 12;
ak = zeros(1,N);
ak(2) = -1j/4; % k = 1
ak(6) = 1j/4; % k = 5
ak(8) = -1j/4; % k = 7
ak(12) = 1j/4; % k = 11
x0 = sin(2*pi*(0:N-1)/3) .* cos(pi*(0:N-1)/2);
periods = 3;
% AK plots
k = 0:N-1;
mag_ak = abs(ak);
phs_ak = angle(ak);
% Set phase to NaN where magnitude is ~0 to avoid noisy angles
tol = 1e-12;
phs_ak(mag_ak < tol) = NaN;
figure('Name','DTFS Coefficients (N=12)','Color','w');
subplot(2,1,1);
stem(k, mag_ak, 'filled', 'LineWidth', 2); grid on;
xlabel('k'); ylabel('|a_k|'); title('Magnitude of DTFS Coefficients');
subplot(2,1,2);
stem(k, phs_ak, 'filled', 'LineWidth', 2); grid on;
xlabel('k'); ylabel('∠a_k (rad)'); title('Phase of DTFS Coefficients');
n = 0:(periods*N - 1);
xper    = x0( mod(n, N) + 1 );                     % original repeated
xhat    = real(ak * exp(1j*2*pi*(k.' .* n)/N));    % reconstruction at integers
figure; hold on; grid on;
subplot(2,1,1)
stem(n, xper, 'o-', 'LineWidth', 2);
xlabel('n'); ylabel('amplitude');
title('Original Function')
grid on
subplot(2,1,2)
stem(n, xhat, '^-', 'LineWidth', 2);
xlabel('n'); ylabel('amplitude');
title('Fourier Series Representation')
grid on