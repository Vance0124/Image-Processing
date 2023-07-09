%clear
clc,clear,close all

file1 = "..\\ImageLab\\rect1.bmp";
[img1,map] = imread(file1);
img1type = imfinfo(file1);      % 转换为灰度图
if strcmp('truecolor',img1type.ColorType) == 1       %图像是真彩色，即RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %图像为索引图像
    Gray = im2uint8(ind2gray(img1,map));             %图像为索引图像
else
    Gray = img1;
end
Gray = im2double(Gray); % 将图像的数值范围由原来的[0,255]，变成[0,1]，效果好一些
F = fft2(Gray);
F=fftshift(F); % 将零频分量移动到数组中心
F = abs(F);     % 求傅里叶变换的模
T = log(F+1);   % 对幅度作变换（由于高、低频幅度相差很大）
figure()
subplot(1,2,1);
imshow(img1,[])
title("original")
subplot(1,2,2);
imshow(T,[])
title("Fourier")