function G = laplace_8(G_row)
    % 8邻域拉普拉斯
    [sx, sy] = size(G_row);
    G = zeros(sx, sy);
%     G = G_row;
    for i = 2:sx-1
        for j = 2 : sy-1
           G(i, j) =  int32(G_row(i-1, j)) + int32(G_row(i+1, j)) + ...
                int32(G_row(i, j+1)) + int32(G_row(i, j-1)) + ...
                    + int32(G_row(i-1, j-1)) + int32(G_row(i+1, j-1))+ ...
                    int32(G_row(i-1, j+1)) +int32(G_row(i+1, j+1))- ...
                    8 * int32(G_row(i, j));
        end
    end
    G = Change(G);  % 尺度变化
 end