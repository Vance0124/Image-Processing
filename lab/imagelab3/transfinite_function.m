function G = transfinite_function(G_row, G_pro, T)
    % G_row : δ�ӹ�ԭ��ͼ G_pro : �ӹ���ľ�ֵͼƬ  T:��ֵ
    [sx, sy] = size(G_row);
    G = zeros(sx, sy);
    for i = 1:sx
        for j = 1 : sy
            % ��Ϊ��ͼ��ĻҶ�ֵ��������޷��ŵģ�С��0��ֱ�ӵ���0��������߶�Ҫ��һ��
            if(abs(G_row(i, j) - G_pro(i, j)) > T || abs(G_pro(i, j) - G_row(i, j)) > T)    
                G(i,j) = G_pro(i, j);
            else
                G(i, j) = G_row(i, j);
            end
        end
    end
 end