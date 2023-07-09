%clear
clc,clear,close all
file1 = "..\\ImageLab\\cameraman.bmp";
warning('off'); %ȥ��warning
[img1,map]=imread(file1);
img1type = imfinfo(file1);      % ת��Ϊ�Ҷ�ͼ
if strcmp('truecolor',img1type.ColorType) == 1       %ͼ�������ɫ����RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %ͼ��Ϊ����ͼ��
    Gray = im2uint8(ind2gray(img1,map));             %ͼ��Ϊ����ͼ��
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
% level=graythresh(imgn); %ȷ���Ҷ���ֵ
% imgn= imbinarize(imgn,level);
subplot(1,3,2);
imshow(imgn,[])
title("�ָ�")
subplot(1,3,3);
imshow(imgm,[])
title("�ϲ�")