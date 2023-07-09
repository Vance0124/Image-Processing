%clear
clc,clear,close all

file1 = "..\\ImageLab\\alphabet1.jpg";
file2 = "..\\ImageLab\\alphabet2.jpg";
img1 = imread(file1);
img2 = imread(file2);
[mp,fp] = cpselect(img2,img1,'Wait',true);  % ʹ��cpselect�����򿪡����Ƶ�ѡ�񡱹���
t = fitgeotrans(mp,fp,'projective');    % �ҵ�����ʹ�ƶ���͹̶�������ͶӰ�任�Ĳ���
 Rfixed = imref2d(size(img1));
 % ͨ��ʹ��OutputView����/ֵ�Բ���ָ��ת�����ͼ��Ĵ�С��λ��������ͼ��Ĵ�С��λ��ƥ��
img3 = imwarp(img2,t,'OutputView',Rfixed);  
figure()
subplot(2,2,1);
imshow(img1)
title('origen')
subplot(2,2,2);
imshow(img2)
title('distortion ')
subplot(2,2,3);
imshow(img3)
title('modify')