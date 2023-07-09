%clear
clc,clear,close all

file1 = "..\\ImageLab\\lena.bmp";
T = input("请选择阈值:");
% file1 = "..\\ImageLab\\cameraman.bmp";
[img1,map] = imread(file1);
gau_img = imnoise(img1, 'gaussian', 0, 0.03);
salt_img = imnoise(img1, 'salt & pepper', 0.03);
ran_img = Random(img1, 0.03);
G_img = medfilt2(gau_img,[3 3],'symmetric');    % 中值滤波
S_img= medfilt2(salt_img,[3 3],'symmetric');  
R_img= medfilt2(ran_img,[3 3],'symmetric');  
G_img = transfinite_function(gau_img, G_img, T);    % 过滤
S_img = transfinite_function(salt_img, S_img, T);
R_img = transfinite_function(ran_img, R_img, T);
subplot(2,4,1);
imshow([img1,map])
title("original")
subplot(2,4,2);
imshow(gau_img)
title("guass")
subplot(2,4,3);
imshow(salt_img)
title("salt")
subplot(2,4,4);
imshow(ran_img)
title("random")
subplot(2,4,6);
imshow(G_img, [])
title("guass去噪")
subplot(2,4,7);
imshow(S_img, [])
title("salt去噪")
subplot(2,4,8);
imshow(R_img, [])
title("random去噪")