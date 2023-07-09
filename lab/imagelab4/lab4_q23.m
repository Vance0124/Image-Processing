%clear
clc,clear,close all

file1 = "..\\ImageLab\\rect1.bmp";
[img1,map] = imread(file1);
F_Gray = fft2(img1);
F=fftshift(F_Gray); % ����Ƶ�����ƶ�����������
F_R = abs(F);     % ����Ҷ�任��ģ
F_ang = angle(F);
T = F_R;   
A = F_ang;
iTimg = log(abs(ifft2(ifftshift(T)))+1); % ����Fourier��任���Է������任�����ڸߡ���Ƶ�������ܴ�
iTang = abs(ifft2(ifftshift(A)));
figure()
subplot(2,2,1);
imshow(img1,[])
title("original")
subplot(2,2,2);
imshow(log(F_R+1),[])
title("Fourier")
subplot(2,2,3);
imshow(iTimg,[])
title("����ifft")
subplot(2,2,4);
imshow(iTang,[])
title("��λifft")