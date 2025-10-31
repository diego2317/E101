w = linspace(-pi, pi, 4000);

figure(1); hold on
for N = 1:16
    H = sin(N * w / 2)./(N * sin(w / 2));
    H(abs(w/2) < 1e-12) = 1;
    plot(w, abs(H), LineWidth=1, DisplayName=['N=' num2str(N)]);
end

xlim([-pi pi])
xticks([-pi -pi/2 -pi/4 -pi/20 0 pi/20 pi/4 pi/2 pi])
xticklabels({'-\pi', '-\pi/2', '-\pi/4', '-\pi/20', '0', '\pi/20', '\pi/4', '\pi/2', '\pi'})
xlabel('\omega (rad/sample)');
ylabel('|H(e^{j\omega})|');
fontsize(gca, 14, "points")
legend
