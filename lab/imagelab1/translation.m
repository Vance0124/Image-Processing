%clear
clc,clear,close all

file = "..\\ImageLab\\alphabet1.jpg";
img = imread(file);     
figure()
x = input("请输入水平移动量x:");
y = input("请输入垂直移动量y:");
se = translate(strel(1), [y,x]);    % strel 用来创建形态学结构元素
img2 = imdilate(img, se);  % 膨胀函数
subplot(1,2,1);
imshow(img)
title('origen')
subplot(1,2,2);
imshow(img2)
title('translation')