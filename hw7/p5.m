clear;
wc = pi/8;
Ms = [16 32 64];
Nfft = 8192;

figure(1);
tl = tiledlayout(3,2,'TileSpacing','compact','Padding','compact');
for k = 1:numel(Ms)
    M = Ms(k);
    n = -M:M;
    h0 = sin(wc*n)./(pi*n);         % truncated ideal impulse
    h0(n==0) = wc/pi;               % n = 0 term
    h = h0;                         % as a vector, this is already causal (delay = M)
    [H,w] = freqz(h,1,Nfft,'whole');
    w = w - 2*pi*(w>pi);            % map to [-pi,pi)

    nexttile;
    plot(w, abs(H), 'r',LineWidth=2);
    xlim([-pi pi]); ylim([0 1.1]);
    xticks([-pi -pi/2 -pi/4 -pi/20 0 pi/20 pi/4 pi/2 pi])
    xticklabels({'-\pi', '-\pi/2', '-\pi/4', '-\pi/20', '0', '\pi/20', '\pi/4', '\pi/2', '\pi'})
    title(sprintf('|H(e^{j\\omega})|, M=%d', M));
    xlabel('\omega (rad/sample)'); ylabel('Magnitude');

    nexttile;
    plot(w, unwrap(angle(H)), 'g', LineWidth=2);
    xlim([-pi pi]);
    xticks([-pi -pi/2 -pi/4 -pi/20 0 pi/20 pi/4 pi/2 pi])
    xticklabels({'-\pi', '-\pi/2', '-\pi/4', '-\pi/20', '0', '\pi/20', '\pi/4', '\pi/2', '\pi'})
    title(sprintf('Phase, M=%d', M));
    xlabel('\omega (rad/sample)'); ylabel('Phase (rad)');
end