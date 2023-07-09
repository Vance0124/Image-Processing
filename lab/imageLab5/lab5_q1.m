%clear
clc,clear,close all

file1 = "..\\ImageLab\\flower1.jpg";
file2 = "..\\ImageLab\\flower2.jpg";
img1 = im2double(imread(file1));
img2 = im2double(imread(file2));
[a,b] = size (img1);
imgtype=imfinfo(file2);
if(strcmp(imgtype.ColorType,'truecolor')==1)
    img2=rgb2gray(img2);
end
img2=imresize(img2,size(img1),'nearest');
Gray = img1;
Gray_move = img2;
gau_img = imnoise(Gray_move, 'gaussian', 0, 0.003);   % Gauss����
Noise = gau_img - Gray_move;
F = fft2(Gray);     % ����������Ҷ
F_move = fft2(Gray_move);    % �˶�ģ���˻�����Ҷ
F_gau = fft2(gau_img);      % Gauss ��������Ҷ
F_inv = IF(F, F_move, F_gau, 0.05, 0.5);    % ���˲�
F_wn = Winer(F, F_move, F_gau, Noise, 1);   % ά��
I_inv = abs(ifft2(F_inv));
I_wn = abs(ifft2(F_wn));
figure()
subplot(2,2,1);
imshow(img1,[])
title("original")
subplot(2,2,2);
imshow(Gray_move,[])
title("�˶�ģ��")
subplot(2,2,3);
imshow(I_inv,[])
title("���˲�")
subplot(2,2,4);
imshow(I_wn,[])
title("ά��")