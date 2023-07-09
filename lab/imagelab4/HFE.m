function M = HFE(F, k, d) % ��Ƶ��ǿ�˲�
    F= fft2(F);
    [SX, SY] = size(F);
    M = zeros(SX, SY);
    for i = 1:SX
        for j = 1:SY
            M(i,j) = k * F(i,j) + d;
        end
    end
    M = ifft2(M);
end
                