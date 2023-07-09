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

floor = input("下限:");   % 直方图范围
upper = input("上限:");
if(upper<floor)
    fprintf("输入上下界限有误!\n")
else
    figure()
    subplot(1,2,1);
    imshow([img1,map])
    title("original")
    subplot(1,2,2);
    edges = floor:(upper+1);    % 由于每个bin包含左边界但不包含右边界，所以要加1
    histogram(Gray(:),edges)    % 直方图
    title("灰度直方图")
end

