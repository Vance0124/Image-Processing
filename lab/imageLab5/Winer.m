function M = Winer(G, F_m, F_n, Noise, s) % ά���˲�
    % F_n: ����ͼ����Ҷ�� G��ԭͼ����Ҷ , F_m :�˶�ģ������Ҷ
    Noise = fft2(Noise); 
    H = F_m ./ G;
    Pn = abs(Noise).^2;
    Pf = abs(F_m) .^2; % �˻�����������
    K = sum(sum(Pn)) / sum(sum(Pf));
    Hw = (abs(H).^2 )./ (H .* (abs(H).^2+s * K));
    M = (F_n).*Hw;
end