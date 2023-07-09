%clear
clc,clear,close all

file1 = "..\\ImageLab\\rect1.bmp";
[img1,map] = imread(file1);
img1type = imfinfo(file1);      % ת��Ϊ�Ҷ�ͼ
if strcmp('truecolor',img1type.ColorType) == 1       %ͼ�������ɫ����RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %ͼ��Ϊ����ͼ��
    Gray = im2uint8(ind2gray(img1,map));             %ͼ��Ϊ����ͼ��
else
    Gray = img1;
end
Gray = im2double(Gray); % ��ͼ�����ֵ��Χ��ԭ����[0,255]�����[0,1]��Ч����һЩ
F = fft2(Gray);
F=fftshift(F); % ����Ƶ�����ƶ�����������
F = abs(F);     % ����Ҷ�任��ģ
T = log(F+1);   % �Է������任�����ڸߡ���Ƶ�������ܴ�
figure()
subplot(1,2,1);
imshow(img1,[])
title("original")
subplot(1,2,2);
imshow(T,[])
title("Fourier")