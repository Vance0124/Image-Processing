%clear
clc,clear,close all

file1 = "..\\ImageLab\\pout.bmp";
% file1 = "..\\ImageLab\\girl.bmp";
[img1,map] = imread(file1);
img1type = imfinfo(file1);      % ת��Ϊ�Ҷ�ͼ
if strcmp('truecolor',img1type.ColorType) == 1       %ͼ�������ɫ����RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %ͼ��Ϊ����ͼ��
    Gray = im2uint8(ind2gray(img1,map));             %ͼ��Ϊ����ͼ��
else
    Gray = img1;
end
d = input("��ֹƵ�ʣ�");
Gray = im2double(Gray); % ��ͼ�����ֵ��Χ��ԭ����[0,255]�����[0,1]��Ч����һЩ
F_Gray = fft2(Gray);
F=fftshift(F_Gray); % ����Ƶ�����ƶ�����������
IM1 = ILPF(F, d);   % ����
IM1_H = F - IM1;    % ��ͨ�� ��ͨ�Ĳ���Ϊ��ͨ
BM1 = BLPF(F, d, 1);   % ������˹
BM1_H = F - BM1;    % ��ͨ
GM1 = GLPF(F, d);   % ��˹
GM1_H = F - GM1;    % ��ͨ
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