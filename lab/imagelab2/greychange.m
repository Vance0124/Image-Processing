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
k = input("请输入斜率k:");
b = input("请输入截距b:");
Gray_change = k * Gray + b;     % 灰度线性变换

figure()
subplot(1,3,1);
imshow([img1,map])
title("original")
subplot(1,3,2);
imshow(Gray)
title("灰度图")
subplot(1,3,3);
imshow(Gray_change)
title("线性变换")

