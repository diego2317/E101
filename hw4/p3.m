% ---- User input: DTFS coefficients for k = 1..5 (complex allowed) ----
a1 = exp(-1j*pi/3);      % a_1
a2 = 2.*exp(1j*pi/6);      % a_2
a3 = 2.*exp(-1j*pi/6);      % a_3
a4 = exp(1j*pi/3);      % a_4
a5 = 2;      % a_5   (note: a_0 == a_5 for N=5)

% ---- Build coefficients for k = -6..6 using period N = 5 --------------
N = 5;
ks = -6:6;

% Lookup table for indices 1..5 corresponding to residues mod 5:
% residue r = mod(k,5) in {0,1,2,3,4} maps to positions [5,1,2,3,4]
base = [a1, a2, a3, a4, a5];
res  = mod(ks, N);              % 0..4
map  = [5 1 2 3 4];             % r=0->5, r=1->1, ..., r=4->4
ak   = base(map(res+1));        % a_k over the requested range

% ---- Plots -------------------------------------------------------------
figure('Name','DTFS Coefficients (N=5)','Color','w');

subplot(2,1,1);
stem(ks, abs(ak), 'filled', 'LineWidth', 1.2); grid on;
xlabel('k'); ylabel('|a_k|');
title('Magnitude of DTFS Coefficients');

subplot(2,1,2);
stem(ks, angle(ak), 'filled', 'LineWidth', 1.2); grid on;
xlabel('k'); ylabel('∠a_k (rad)');
title('Phase of DTFS Coefficients');

% Optional: annotate that a_0 == a_5
disp('Note: For N=5, a_0 ≡ a_5 and a_{k+5} = a_k (periodicity).');
