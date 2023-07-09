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

floor = input("����:");   % ֱ��ͼ��Χ
upper = input("����:");
if(upper<floor)
    fprintf("�������½�������!\n")
else
    figure()
    subplot(1,2,1);
    imshow([img1,map])
    title("original")
    subplot(1,2,2);
    edges = floor:(upper+1);    % ����ÿ��bin������߽絫�������ұ߽磬����Ҫ��1
    histogram(Gray(:),edges)    % ֱ��ͼ
    title("�Ҷ�ֱ��ͼ")
end

