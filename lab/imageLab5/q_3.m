%clear
clc,clear,close all
file1 = "..\\ImageLab\\cameraman.bmp";
warning('off'); %去除warning
[img1,map]=imread(file1);
img1type = imfinfo(file1);      % 转换为灰度图
if strcmp('truecolor',img1type.ColorType) == 1       %图像是真彩色，即RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %图像为索引图像
    Gray = im2uint8(ind2gray(img1,map));             %图像为索引图像
else
    Gray = img1;
end
% Gray=mat2gray(img);
%img=rgb2gray(img);
figure()
subplot(1,3,1);
imshow(img1,[]);
title("original")

% Gray = im2double(Gray);
k = 10;
imgn=split(Gray, k);
h = 10;
imgm = merge(imgn, h);
% level=graythresh(imgn); %确定灰度阈值
% imgn= imbinarize(imgn,level);
subplot(1,3,2);
imshow(imgn,[])
title("分割")
subplot(1,3,3);
imshow(imgm,[])
title("合并")