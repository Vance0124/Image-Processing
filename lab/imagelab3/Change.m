function Gray_change = Change(Gray)   
    % 通过尺度变换变回到：0－255 范围
    x1 = min(min(Gray));    % 最小值
    y1 = 0;
    x2 = max(max(Gray));    % 最大值
    y2 = 255;
    [sx, sy] = size(Gray);
    Gray_change = zeros(sx, sy);
    for i = 1:sx
        for j =1:sy
            Gray_change(i,j) = (y2-y1)/(x2-x1) * (Gray(i,j)-x1) + y1;   % 拉伸
        end
    end
end