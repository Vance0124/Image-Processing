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

floor = 0;
upper = 255;
x = 0:5:255;
Gray_x = normpdf(x, 128, 64);
Gray_equ = histeq(Gray);  %ֱ��ͼ���⻯
Gray_gau = histeq(Gray, Gray_x);    % ��˹
if(upper<floor)
    fprintf("�������½�������!\n")
else
    figure()
    subplot(3,2,1);
    imshow([img1,map])
    title("original")
    subplot(3,2,2);
    edges = floor:(upper+1);    % ����ÿ��bin������߽絫�������ұ߽磬����Ҫ��1
    histogram(Gray(:),edges)
    title("�Ҷ�ֱ��ͼ")
    subplot(3,2,3);
    edges = floor:(upper+1);    % ����ÿ��bin������߽絫�������ұ߽磬����Ҫ��1
    histogram(Gray_equ(:),edges)
    title("ֱ��ͼ���⻯")
    subplot(3,2,4);
    imshow(Gray_equ)
    title("ֱ��ͼ���⻯")
    subplot(3,2,5);
    edges = floor:(upper+1);    % ����ÿ��bin������߽絫�������ұ߽磬����Ҫ��1
    histogram(Gray_gau(:),edges)
    title("Gauss")
    subplot(3,2,6);
    imshow(Gray_gau)
    title("Gauss")
end
