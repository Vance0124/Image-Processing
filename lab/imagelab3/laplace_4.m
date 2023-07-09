function G = laplace_4(G_row)
    [sx, sy] = size(G_row);
    G = zeros(sx, sy);
    for i = 2:sx-1
        for j = 2 : sy-1
            % 4¡⁄”Ú¿≠∆’¿≠Àπ
           G(i, j) =  int32(G_row(i-1, j)) + int32(G_row(i+1, j)) + int32(G_row(i, j+1)) + int32(G_row(i, j-1)) - 4* int32(G_row(i, j));
        end
    end
    G = Change(G);
 end