%clear
clc,clear,close all

% file1 = "..\\ImageLab\\rect2.bmp";
% file1 = "..\\ImageLab\\rect2.bmp";
file1 = "..\\ImageLab\\lena.bmp";
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
F_Gray = fft2(Gray);
R = real(F_Gray);   % 实部
I = imag(F_Gray);   % 虚部
F_back = R - I * 1i;        %共轭
img_back = ifft2(F_back);
figure()
subplot(1,2,1);
imshow(img1,[])
title("original")
subplot(1,2,2);
imshow(img_back,[])
title("共轭")