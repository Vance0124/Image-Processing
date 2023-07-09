function M = IF(G, F_m, F_n, d, k) % 逆滤波, k,d < 1
    % F_n: 噪声图像傅里叶， G：原图像傅里叶 , F_m :运动模糊傅里叶
    H = F_m ./ G;   % 滤波矩阵
    [m, n] = size(G);
    M = zeros(m,n);
    for i = 1 : m
        for j = 1 : n
            if(abs(H(i ,j)) < d)
                M(i,j) = F_n(i,j) * k;
            else
                M(i,j) = F_n(i,j) / H(i, j);
            end
        end
    end
%     M = F_n ./ H;
end
                