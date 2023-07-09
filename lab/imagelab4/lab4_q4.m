%clear
clc,clear,close all

% file1 = "..\\ImageLab\\rect2.bmp";
% file1 = "..\\ImageLab\\rect2.bmp";
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
Gray = im2double(Gray); % ��ͼ�����ֵ��Χ��ԭ����[0,255]�����[0,1]��Ч����һЩ
F_Gray = fft2(Gray);
R = real(F_Gray);   % ʵ��
I = imag(F_Gray);   % �鲿
F_back = R - I * 1i;        %����
img_back = ifft2(F_back);
figure()
subplot(1,2,1);
imshow(img1,[])
title("original")
subplot(1,2,2);
imshow(img_back,[])
title("����")