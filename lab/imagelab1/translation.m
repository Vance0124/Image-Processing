%clear
clc,clear,close all

file = "..\\ImageLab\\alphabet1.jpg";
img = imread(file);     
figure()
x = input("������ˮƽ�ƶ���x:");
y = input("�����봹ֱ�ƶ���y:");
se = translate(strel(1), [y,x]);    % strel ����������̬ѧ�ṹԪ��
img2 = imdilate(img, se);  % ���ͺ���
subplot(1,2,1);
imshow(img)
title('origen')
subplot(1,2,2);
imshow(img2)
title('translation')