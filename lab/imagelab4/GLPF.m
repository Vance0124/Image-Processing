function M = GLPF(F, d) % 高斯
    % F: 原Fourier变换结果矩阵， d：阈值
    [m,n] = size(F);
    M = zeros(m,n);
    Mid_m = m/2;
    Mid_n = n/2;
    for i = 1 : m
        for j = 1 : n
            M(i,j) = F(i,j) * exp(-((i - Mid_m)^2 ...
            + (j - Mid_n)^2)/(2 * d^2));
        end
    end
end
                