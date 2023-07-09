function M = IF(G, F_m, F_n, d, k) % ���˲�, k,d < 1
    % F_n: ����ͼ����Ҷ�� G��ԭͼ����Ҷ , F_m :�˶�ģ������Ҷ
    H = F_m ./ G;   % �˲�����
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
                