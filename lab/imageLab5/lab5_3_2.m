%clear
clc,clear,close all
file1 = "..\\ImageLab\\cameraman.bmp";
[img1,map]=imread(file1);
img1type = imfinfo(file1);      % 转换为灰度图
if strcmp('truecolor',img1type.ColorType) == 1       %图像是真彩色，即RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %图像为索引图像
    Gray = im2uint8(ind2gray(img1,map));             %图像为索引图像
else
    Gray = img1;
end  

g=splitmerge(Gray,2,@predicate);%2代表分割中允许最小的块，predicate函数返回1，说明需要再分裂，返回0说明不需要继续分裂
figure();
subplot(1,2,1);
imshow(Gray);
title('原图');
subplot(1,2,2);
imshow(g);
title('图像');