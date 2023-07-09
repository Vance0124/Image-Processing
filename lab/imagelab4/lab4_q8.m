%clear
clc,clear,close all

file1 = "..\\ImageLab\\pout.bmp";
[img1,map] = imread(file1);
img1type = imfinfo(file1);      % 转换为灰度图
if strcmp('truecolor',img1type.ColorType) == 1       %图像是真彩色，即RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %图像为索引图像
    Gray = im2uint8(ind2gray(img1,map));             %图像为索引图像
else
    Gray = img1;
end

% 高频增强滤波
% Gray = im2double(Gray); % 将图像的数值范围由原来的[0,255]，变成[0,1]，效果好一些

G_HFE = uint8(HFE(Gray, 1.25, 10));

Gray_his = histeq(Gray);  
G_His_HFE = uint8(HFE(Gray_his, 1.25, 10)); % 直方图均衡化后高频增强
G_HFE_His = histeq(G_HFE);  % 高频增强后直方图均衡化 
figure()
subplot(2,2,1);
imshow(img1,[])
title("original")
subplot(2,2,2);
imshow(G_HFE_His,[])
title("高频增强后直方图均衡")
subplot(2,2,3);
imshow(G_His_HFE,[])
title("直方图均衡后高频增强")