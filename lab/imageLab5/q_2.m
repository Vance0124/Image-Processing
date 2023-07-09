%clear
clc,clear,close all

file1 = "..\\ImageLab\\lena.bmp";
[img1,map] = imread(file1);
img1type = imfinfo(file1);      % ת��Ϊ�Ҷ�ͼ
if strcmp('truecolor',img1type.ColorType) == 1       %ͼ�������ɫ����RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %ͼ��Ϊ����ͼ��
    Gray = im2uint8(ind2gray(img1,map));             %ͼ��Ϊ����ͼ��
else
    Gray = img1;
end
level=graythresh(Gray); %OSTU��ȷ���Ҷ���ֵ
BW= imbinarize(Gray,level); % ת��Ϊ��ֵͼ��
figure()
subplot(1,2,1);
imshow(img1,[])
title("original")
subplot(1,2,2);
imshow(BW,[])
title("OTSU")


