%clear
clc,clear,close all

file1 = "..\\ImageLab\\lena.bmp";
T = input("请选择阈值:");
% file1 = "..\\ImageLab\\cameraman.bmp";
[img1,map] = imread(file1);
gau_img = imnoise(img1, 'gaussian', 0, 0.03);
salt_img = imnoise(img1, 'salt & pepper', 0.03);
ran_img = Random(img1, 0.03);
I_3=fspecial('average',[3,3]);%3*3均值滤波
G_img=imfilter(gau_img,I_3);
S_img=imfilter(salt_img,I_3);
R_img=imfilter(ran_img,I_3);
G_img = transfinite_function(gau_img, G_img, T);
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
imshow(G_img,[])    % 做运算时，为了保证精度，会将Gray_change转化为double，'[]'会自适应取值范围
title("guass去噪")
subplot(2,4,7);
imshow(S_img, [])   % 做运算时，为了保证精度，会将Gray_change转化为double，'[]'会自适应取值范围
title("salt去噪")
subplot(2,4,8);
imshow(R_img, [])   % 做运算时，为了保证精度，会将Gray_change转化为double，'[]'会自适应取值范围
title("random去噪")