%clear
clc,clear,close all

file1 = "..\\ImageLab\\rect1.bmp";
[img1,map] = imread(file1);
F_Gray = fft2(img1);
F=fftshift(F_Gray); % 将零频分量移动到数组中心
F_R = abs(F);     % 求傅里叶变换的模
F_ang = angle(F);
T = F_R;   
A = F_ang;
iTimg = log(abs(ifft2(ifftshift(T)))+1); % 幅度Fourier逆变换，对幅度作变换（由于高、低频幅度相差很大）
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
title("幅度ifft")
subplot(2,2,4);
imshow(iTang,[])
title("相位ifft")