%clear
clc,clear,close all

file1 = "..\\ImageLab\\alphabet1.jpg";
file2 = "..\\ImageLab\\alphabet2.jpg";
img1 = imread(file1);
img2 = imread(file2);
[mp,fp] = cpselect(img2,img1,'Wait',true);  % 使用cpselect函数打开“控制点选择”工具
t = fitgeotrans(mp,fp,'projective');    % 找到最能使移动点和固定点对齐的投影变换的参数
 Rfixed = imref2d(size(img1));
 % 通过使用OutputView名称/值对参数指定转换后的图像的大小和位置与正射图像的大小和位置匹配
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