%clear
clc,clear,close all

file = "C:\\Desktop\\图像处理实验\\ImageLab\\alphabet1.jpg";
img = imread(file);
figure()
x = input("请输入旋转水平坐标x:");
y = input("请输入旋转垂直坐标y:");
angle = input("请输入旋转角度:");
se = translate(strel(1), [-y,-x]);  % strel 用来创建形态学结构元素，旋转点移动到原点
img_tran = imdilate(img, se);       % 膨胀函数
img_ro = imrotate(img_tran, angle); % 默认最近邻插值
img_ro2 = imrotate(img_tran, angle, 'bilinear');  % 双线性插值
se2 = translate(strel(1), [y,x]);   % 旋转点移动回去
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