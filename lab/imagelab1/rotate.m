%clear
clc,clear,close all

file = "C:\\Desktop\\ͼ����ʵ��\\ImageLab\\alphabet1.jpg";
img = imread(file);
figure()
x = input("��������תˮƽ����x:");
y = input("��������ת��ֱ����y:");
angle = input("��������ת�Ƕ�:");
se = translate(strel(1), [-y,-x]);  % strel ����������̬ѧ�ṹԪ�أ���ת���ƶ���ԭ��
img_tran = imdilate(img, se);       % ���ͺ���
img_ro = imrotate(img_tran, angle); % Ĭ������ڲ�ֵ
img_ro2 = imrotate(img_tran, angle, 'bilinear');  % ˫���Բ�ֵ
se2 = translate(strel(1), [y,x]);   % ��ת���ƶ���ȥ
img_tranback = imdilate(img_ro, se2);
img_tranback2 = imdilate(img_ro2, se2);
subplot(2,2,1);
imshow(img)
title('origen')
subplot(2,2,2);
imshow(img_tranback)
title('nearest')
subplot(2,2,3);
imshow(img_tranback2)
title('bilinear')