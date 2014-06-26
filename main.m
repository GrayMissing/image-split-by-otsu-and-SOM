clear;clc;
% ------ 预处理,转换灰度图 ------ %
p1 = imread('ChinaLakeAirport.jpg');
p2 = imread('FarmhouseNearAlbuquerque.jpg');
gp1 = rgb2gray(p1);
gp2 = rgb2gray(p2);
gp1 = medfilt2(gp1);
gp2 = medfilt2(gp2);
% ------ Otsu算法分割 ------ %
level1 = graythresh(gp1);% 计算阈值
level2 = graythresh(gp2);
go1 = im2bw(gp1, level1);% 
go2 = im2bw(gp2, level2);
subplot(2, 3, 1), imshow(gp1);
subplot(2, 3, 2), imshow(go1);
subplot(2, 3, 4), imshow(gp2);
subplot(2, 3, 5), imshow(go2);
% ------ 基于自组织映射神经网络的分割 ------ %
image1 = double(gp1(:));
image2 = double(gp2(:));
c = 2;
alpha = 0.0001;
max_iter = 5;
m1 = SOM(image1, c, alpha, max_iter);

level1 = mean(m1) / 255;
gs1 = im2bw(gp1, level1);
m2 = SOM(image2, c, alpha, max_iter);
level2 = mean(m2) / 255;
gs2 = im2bw(gp2, level2);
subplot(2, 3, 3), imshow(gs1);
subplot(2, 3, 6), imshow(gs2);

    
