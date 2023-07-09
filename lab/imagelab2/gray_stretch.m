%clear
clc,clear,close all

file1 = "..\\ImageLab\\lena.bmp";

[img1,map] = imread(file1);
img1type = imfinfo(file1);
if strcmp('truecolor',img1type.ColorType) == 1       %ͼ�������ɫ����RGB
    Gray = im2uint8(rgb2gray(img1));
elseif strcmp('indexed',img1type.ColorType) == 1    %ͼ��Ϊ����ͼ��
    Gray = im2uint8(ind2gray(img1,map));             %ͼ��Ϊ����ͼ��
else
    Gray = img1;
end
x1 = input("�������һ���ֶκ���ת�۵�x1:");
y1 = input("y1:");
x2 = input("������ڶ����ֶκ���ת�۵�x2:");
y2 = input("y2:");
[sx, sy] = size(Gray);
Gray_change = zeros(sx,sy); 
for i = 1:sx        % �Ҷ�����
    for j =1:sy
        if(Gray(i,j)<x1)
            Gray_change(i,j) = y1/x1 * Gray(i,j);
        elseif(Gray(i,j)<= x2)
            Gray_change(i,j) = (y2-y1)/(x2-x1) * (Gray(i,j)-x1) + y1;
        else
            Gray_change(i,j) = (255-y2)/(255-x2) * (Gray(i,j)-x2) + y2;
        end
    end
end
figure()
subplot(1,3,1);
imshow([img1,map])
title("original")
subplot(1,3,2);
imshow(Gray)
title("�Ҷ�ͼ")
subplot(1,3,3);
imshow(Gray_change,[])      % ������ʱ��Ϊ�˱�֤���ȣ��ὫGray_changeת��Ϊdouble��'[]'������Ӧȡֵ��Χ
title("gray stretch")

