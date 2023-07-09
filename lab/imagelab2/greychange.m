%clear
clc,clear,close all

file1 = "..\\ImageLab\\lena.bmp";

[img1,map] = imread(file1);
img1type = imfinfo(file1);
if strcmp('truecolor',img1type.ColorType) == 1       %ͼ�������ɫ����RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %ͼ��Ϊ����ͼ��
    Gray = im2uint8(ind2gray(img1,map));             %ͼ��Ϊ����ͼ��
else
    Gray = img1;
end
k = input("������б��k:");
b = input("������ؾ�b:");
Gray_change = k * Gray + b;     % �Ҷ����Ա任

figure()
subplot(1,3,1);
imshow([img1,map])
title("original")
subplot(1,3,2);
imshow(Gray)
title("�Ҷ�ͼ")
subplot(1,3,3);
imshow(Gray_change)
title("���Ա任")

