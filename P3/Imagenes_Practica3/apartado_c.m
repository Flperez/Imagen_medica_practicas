clear all;clc;
disp('Practica 3: apartado C ')
disp('Segmentación usando el algoritmo watershed')

img = imread('higado.bmp');
img = rgb2gray(img);
Hx = fspecial('sobel');
Hy = Hx';

imgx = double(imfilter(img,Hx));
imgy = double(imfilter(img,Hy));
imgxy = sqrt(imgx.^2+imgy.^2);



L = watershed(imgxy);
L(~imgxy) = 0;
rgb = label2rgb(L,'jet',[.5 .5 .5]);
figure(1)
subplot(1,3,1);imshow(img);title('higado.bmp');
subplot(1,3,2);imshow(uint8(imgxy));title('Imagen gradiente xy');
subplot(1,3,3);imshow(rgb,'InitialMagnification','fit');title('Watershed segmentation');
% 
% Funcion imimposemin

D = bwdist(imgxy);

D = -D;
D(~imgxy) = Inf;


% BW = false(size(imgxy));
% xmin=751;xmax=1158;
% ymin=279;ymax=789;
% 
% BW(xmin:xmax,ymin:ymax) = true;
% imgxymodif = imimposemin(imgxy,BW);

L = watershed(D);
L(~imgxy) = 0;
rgb = label2rgb(L,'jet',[.5 .5 .5]);
figure(2)
subplot(1,3,1);imshow(img);title('higado.bmp');
subplot(1,3,2);imshow(uint8(D));title('Imagen distancia');
subplot(1,3,3);imshow(rgb,'InitialMagnification','fit');title('Watershed segmentation');





