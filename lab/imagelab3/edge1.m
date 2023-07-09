%clear
clc,clear,close all

file1 = "..\\ImageLab\\lena.bmp";
% file1 = "..\\ImageLab\\blood.bmp";
T = input("ÇëÑ¡ÔñãÐÖµ:");
% file1 = "..\\ImageLab\\cameraman.bmp";
[img2,map] = imread(file1);
img1type = imfinfo(file1);
if strcmp('truecolor',img1type.ColorType) == 1       %Í¼ÏñÊÇÕæ²ÊÉ«£¬¼´RGB
    Gray = im2uint8(rgb2gray(img2));
elseif strcmp('indexed',img1type.ColorType) == 1    %Í¼ÏñÎªË÷ÒýÍ¼Ïñ
    Gray = im2uint8(ind2gray(img2,map));             %Í¼ÏñÎªË÷ÒýÍ¼Ïñ
else
    Gray = img2;
end
img1 = Gray;
Ro_img = edge(img1,'Roberts', T);   % 1
So_img = edge(img1,'Sobel',T);      % 2
Pre_img = edge(img1,'Prewitt',T);   % 3
Can_img = edge(img1,'Canny', T);    % 5
La_img1 = laplace_4(img1);          % 4_1
La_img2 = laplace_8(img1);          % 4_2
subplot(3,3,1);
imshow(img2)
title("original")
subplot(3,3,2);
imshow(Ro_img)
title("Roberts")
subplot(3,3,3);
imshow(So_img)
title("Sobel")
subplot(3,3,4);
imshow(Pre_img)
title("Prewitt")
subplot(3,3,5);
imshow(La_img1,[])
title("Laplace_4")
subplot(3,3,6);
imshow(La_img2,[])
title("Laplace_8")
subplot(3,3,7);
imshow(Can_img)
title("Canny")