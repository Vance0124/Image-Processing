%clear
clc,clear,close all

% file1 = "C:\\Desktop\\ͼ����ʵ��\\ImageLab\\rect1.bmp";
file1 = "..\\ImageLab\\Girl.bmp";
[img1,map] = imread(file1);
img1type = imfinfo(file1);      % ת��Ϊ�Ҷ�ͼ
if strcmp('truecolor',img1type.ColorType) == 1       %ͼ�������ɫ����RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %ͼ��Ϊ����ͼ��
    Gray = im2uint8(ind2gray(img1,map));             %ͼ��Ϊ����ͼ��
else
    Gray = img1;
end
gau_img = imnoise(Gray, 'gaussian', 0, 0.03);   % Gauss����
salt_img = imnoise(Gray, 'salt & pepper', 0.03);    % ��������
d = input("��ֹƵ�ʣ�");
gau_img = im2double(gau_img); % ��ͼ�����ֵ��Χ��ԭ����[0,255]�����[0,1]��Ч����һЩ
F_gau = fft2(gau_img);
F_gau = fftshift(F_gau); % ����Ƶ�����ƶ�����������
IM1_G = ILPF(F_gau, d);   % ����
BM1_G = BLPF(F_gau, d, 1);   % ������˹
GM1_G = GLPF(F_gau, d);   % ��˹
FIM1_G = abs(ifft2(ifftshift(IM1_G)));
FBM1_G = abs(ifft2(ifftshift(BM1_G)));
FGM1_G = abs(ifft2(ifftshift(GM1_G)));
salt_img = im2double(salt_img); % ��ͼ�����ֵ��Χ��ԭ����[0,255]�����[0,1]��Ч����һЩ
F_salt = fft2(salt_img);
F_salt = fftshift(F_salt); % ����Ƶ�����ƶ�����������
IM1_S = ILPF(F_salt, d);   % ����
BM1_S = BLPF(F_salt, d, 1);   % ������˹
GM1_S = GLPF(F_salt, d);   % ��˹
FIM1_S = abs(ifft2(ifftshift(IM1_S)));
FBM1_S = abs(ifft2(ifftshift(BM1_S)));
FGM1_S = abs(ifft2(ifftshift(GM1_S)));
figure()
subplot(4,2,1);
imshow(gau_img,[])
title("Gauss")
subplot(4,2,2);
imshow(salt_img,[])
title("Salt")
subplot(4,2,3);
imshow(FIM1_G,[])
title("ILPF\_GAUSS")
subplot(4,2,5);
imshow(FBM1_G,[])
title("BLPF\_GAUSS")
subplot(4,2,7);
imshow(FGM1_G,[])
title("GLPF\_GAUSS")
subplot(4,2,4);
imshow(FIM1_S,[])
title("ILPF\_SALT")
subplot(4,2,6);
imshow(FBM1_S,[])
title("BLPF\_SALT")
subplot(4,2,8);
imshow(FGM1_S,[])
title("GLPF\_SALT")