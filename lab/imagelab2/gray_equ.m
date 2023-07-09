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

floor = 0;
upper = 255;
x = 0:5:255;
Gray_x = normpdf(x, 128, 64);
Gray_equ = histeq(Gray);  %直方图均衡化
Gray_gau = histeq(Gray, Gray_x);    % 高斯
if(upper<floor)
    fprintf("输入上下界限有误!\n")
else
    figure()
    subplot(3,2,1);
    imshow([img1,map])
    title("original")
    subplot(3,2,2);
    edges = floor:(upper+1);    % 由于每个bin包含左边界但不包含右边界，所以要加1
    histogram(Gray(:),edges)
    title("灰度直方图")
    subplot(3,2,3);
    edges = floor:(upper+1);    % 由于每个bin包含左边界但不包含右边界，所以要加1
    histogram(Gray_equ(:),edges)
    title("直方图均衡化")
    subplot(3,2,4);
    imshow(Gray_equ)
    title("直方图均衡化")
    subplot(3,2,5);
    edges = floor:(upper+1);    % 由于每个bin包含左边界但不包含右边界，所以要加1
    histogram(Gray_gau(:),edges)
    title("Gauss")
    subplot(3,2,6);
    imshow(Gray_gau)
    title("Gauss")
end
