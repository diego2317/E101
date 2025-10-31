N=8;
N1 = 16;
w = linspace(-pi, pi, 4000);
H = sin(N * w / 2)./(N * sin(w / 2));
H1 = sin(N1 * w / 2)./(N1 * sin(w / 2));
H(abs(w/2) < 1e-12) = 1;
H1(abs(w/2) < 1e-12) = 1;

figure(1)
plot(w, abs(H), 'r', LineWidth=2, DisplayName='N=8');
hold on
plot(w, abs(H1), 'g', LineWidth=2, DisplayName='N=16');
xlim([-pi pi])
xticks([-pi -pi/2 -pi/4 -pi/20 0 pi/20 pi/4 pi/2 pi])
xticklabels({'-\pi', '-\pi/2', '-\pi/4', '-\pi/20', '0', '\pi/20', '\pi/4', '\pi/2', '\pi'})
xlabel('\omega (rad/sample)');
ylabel('|H(e^{j \omega})|');

fontsize(gca, 14, "points")
legend;