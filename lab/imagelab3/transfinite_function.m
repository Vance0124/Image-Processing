function G = transfinite_function(G_row, G_pro, T)
    % G_row : 未加工原生图 G_pro : 加工完的均值图片  T:阈值
    [sx, sy] = size(G_row);
    G = zeros(sx, sy);
    for i = 1:sx
        for j = 1 : sy
            % 因为是图像的灰度值，因此是无符号的，小于0会直接等于0，因此两边都要减一下
            if(abs(G_row(i, j) - G_pro(i, j)) > T || abs(G_pro(i, j) - G_row(i, j)) > T)    
                G(i,j) = G_pro(i, j);
            else
                G(i, j) = G_row(i, j);
            end
        end
    end
 end