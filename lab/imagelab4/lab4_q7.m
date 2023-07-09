%clear
clc,clear,close all

file1 = "..\\ImageLab\\pout.bmp";
% file1 = "..\\ImageLab\\girl.bmp";
[img1,map] = imread(file1);
img1type = imfinfo(file1);      % 转换为灰度图
if strcmp('truecolor',img1type.ColorType) == 1       %图像是真彩色，即RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %图像为索引图像
    Gray = im2uint8(ind2gray(img1,map));             %图像为索引图像
else
    Gray = img1;
end
d = input("截止频率：");
Gray = im2double(Gray); % 将图像的数值范围由原来的[0,255]，变成[0,1]，效果好一些
F_Gray = fft2(Gray);
F=fftshift(F_Gray); % 将零频分量移动到数组中心
IM1 = ILPF(F, d);   % 理想
IM1_H = F - IM1;    % 高通， 低通的补即为高通
BM1 = BLPF(F, d, 1);   % 巴特沃斯
BM1_H = F - BM1;    % 高通
GM1 = GLPF(F, d);   % 高斯
GM1_H = F - GM1;    % 高通
FIM1 = abs(ifft2(ifftshift(IM1_H)));
FBM1 = abs(ifft2(ifftshift(BM1_H)));
FGM1 = abs(ifft2(ifftshift(GM1_H)));
figure()
subplot(2,2,1);
imshow(img1,[])
title("original")
subplot(2,2,2);
imshow(FIM1,[])
title("ILPF")
subplot(2,2,3);
imshow(FBM1,[])
title("BLPF")
subplot(2,2,4);
imshow(FGM1,[])
title("GLPF")