%clear
clc,clear,close all

c = input("������ˮƽ���ű���c:");
d = input("�����봹ֱ���ű���d:");
file = "..\\ImageLab\\alphabet1.jpg";
img = imread(file);
[h,w,c2] = size(img);
img2 = imresize(img, [d * h, c * w], 'nearest');
img3 = imresize(img, [d * h, c * w], 'bilinear');

figure()
subplot(2,2,1);
imshow(img)
title('origen')
subplot(2,2,2);
imshow(img2)
title('nearest')
subplot(2,2,3);
imshow(img3)
title('bilinear')