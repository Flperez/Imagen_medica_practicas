clear; close all;clc;
disp('Practica 1: apartado 2')

colormap(gray)
T1=imread('T1.png');
T1d = im2double(T1);

% 1-- Filtro NLM
t = 2; % radio of search window
f = 2; %: radio of similarity window
h = 1; % degree of filtering
img_NLM=NLmeansfilter(T1d,t,f,h);


% 2 -- Filtro Gaussiano
T1G = imgaussfilt(T1,0.5);

% 3 -- Filtro Perona-Malik
niter = 100;
k = 1;
lambda = 0.0001;
opcion = 1;
T1PM = dif_aniso(T1,niter,k,lambda,opcion);


% Mostrar los resultados
subplot(2,2,1);imshow(T1);title('Imagen original');
subplot(2,2,2);imshow(img_NLM);title('Filtro NLM');
subplot(2,2,3);imshow(T1G);title('Filtro Gaussiano');
subplot(2,2,4);imagesc(T1PM);title('Filtro Perona-Malik');
