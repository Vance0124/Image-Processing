%clear
clc,clear,close all

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
level=graythresh(Gray); %OSTU法确定灰度阈值
BW= imbinarize(Gray,level); % 转化为二值图像
figure()
subplot(1,2,1);
imshow(img1,[])
title("original")
subplot(1,2,2);
imshow(BW,[])
title("OTSU")


