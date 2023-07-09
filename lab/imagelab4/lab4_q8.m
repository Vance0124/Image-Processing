%clear
clc,clear,close all

file1 = "..\\ImageLab\\pout.bmp";
[img1,map] = imread(file1);
img1type = imfinfo(file1);      % ת��Ϊ�Ҷ�ͼ
if strcmp('truecolor',img1type.ColorType) == 1       %ͼ�������ɫ����RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %ͼ��Ϊ����ͼ��
    Gray = im2uint8(ind2gray(img1,map));             %ͼ��Ϊ����ͼ��
else
    Gray = img1;
end

% ��Ƶ��ǿ�˲�
% Gray = im2double(Gray); % ��ͼ�����ֵ��Χ��ԭ����[0,255]�����[0,1]��Ч����һЩ

G_HFE = uint8(HFE(Gray, 1.25, 10));

Gray_his = histeq(Gray);  
G_His_HFE = uint8(HFE(Gray_his, 1.25, 10)); % ֱ��ͼ���⻯���Ƶ��ǿ
G_HFE_His = histeq(G_HFE);  % ��Ƶ��ǿ��ֱ��ͼ���⻯ 
figure()
subplot(2,2,1);
imshow(img1,[])
title("original")
subplot(2,2,2);
imshow(G_HFE_His,[])
title("��Ƶ��ǿ��ֱ��ͼ����")
subplot(2,2,3);
imshow(G_His_HFE,[])
title("ֱ��ͼ������Ƶ��ǿ")