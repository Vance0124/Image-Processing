function M = ILPF(F, d)
    % �����ͨ�˲��� F: ԭFourier�任������� d����ֵ
    [m,n] = size(F);
    M = zeros(m,n);
    Mid_m = m/2;
    Mid_n = n/2;
    for i = 1 : m
        for j = 1 : n
            if(sqrt((i - Mid_m)^2 + (j - Mid_n)^2)<= d)
                M(i,j) = F(i,j);
            end
        end
    end
end
                