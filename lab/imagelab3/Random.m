function G = Random(Gray, P)   
    [sx, sy] = size(Gray);
    G = Gray;
    for i = 1:sx
        for j =1:sy
            if(rand() <= P)
                G(i,j) = int32(rand()*256);
%                 fprintf('%d ', G(i,j));
            else
                G(i,j) = Gray(i, j);
            end
        end
    end