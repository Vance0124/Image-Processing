function M = Winer(G, F_m, F_n, Noise, s) % 维纳滤波
    % F_n: 噪声图像傅里叶， G：原图像傅里叶 , F_m :运动模糊傅里叶
    Noise = fft2(Noise); 
    H = F_m ./ G;
    Pn = abs(Noise).^2;
    Pf = abs(F_m) .^2; % 退化函数功率谱
    K = sum(sum(Pn)) / sum(sum(Pf));
    Hw = (abs(H).^2 )./ (H .* (abs(H).^2+s * K));
    M = (F_n).*Hw;
end