%clear
clc,clear,close all

file1 = "..\\ImageLab\\lena.bmp";

[img1,map] = imread(file1);
img1type = imfinfo(file1);
if strcmp('truecolor',img1type.ColorType) == 1       %图像是真彩色，即RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %图像为索引图像
    Gray = im2uint8(ind2gray(img1,map));             %图像为索引图像
else
    Gray = img1;
end
x1 = input("请输入第一个分段函数转折点x1:");
y1 = input("y1:");
x2 = input("请输入第二个分段函数转折点x2:");
y2 = input("y2:");
[sx, sy] = size(Gray);
Gray_change = zeros(sx,sy); 
for i = 1:sx        % 灰度拉伸
    for j =1:sy
        if(Gray(i,j)<x1)
            Gray_change(i,j) = y1/x1 * Gray(i,j);
        elseif(Gray(i,j)<= x2)
            Gray_change(i,j) = (y2-y1)/(x2-x1) * (Gray(i,j)-x1) + y1;
        else
            Gray_change(i,j) = (255-y2)/(255-x2) * (Gray(i,j)-x2) + y2;
        end
    end
end
figure()
subplot(1,3,1);
imshow([img1,map])
title("original")
subplot(1,3,2);
imshow(Gray)
title("灰度图")
subplot(1,3,3);
imshow(Gray_change,[])      % 做运算时，为了保证精度，会将Gray_change转化为double，'[]'会自适应取值范围
title("gray stretch")

