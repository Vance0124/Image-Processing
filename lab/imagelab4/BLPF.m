function M = BLPF(F, d, N) % 巴特沃斯
    % F: 原Fourier变换结果矩阵， d：阈值
    [m,n] = size(F);
    M = zeros(m,n);
    Mid_m = m/2;
    Mid_n = n/2;
    for i = 1 : m
        for j = 1 : n
            M(i,j) = F(i,j) *(1/ ...  % 巴特沃斯
            (1+((sqrt((i - Mid_m)^2 + (j - Mid_n)^2))/d)^(2* N)));
        end
    end
end
                