function Gray_change = Change(Gray)   
    % ͨ���߶ȱ任��ص���0��255 ��Χ
    x1 = min(min(Gray));    % ��Сֵ
    y1 = 0;
    x2 = max(max(Gray));    % ���ֵ
    y2 = 255;
    [sx, sy] = size(Gray);
    Gray_change = zeros(sx, sy);
    for i = 1:sx
        for j =1:sy
            Gray_change(i,j) = (y2-y1)/(x2-x1) * (Gray(i,j)-x1) + y1;   % ����
        end
    end
end