clear all; close all; clc;
disp('Practica 1: apartado 1.1')
T1 = (imread('T1.png'));
T1d = im2double(T1);


lambda_inicio=0.1;
lambda_fin=5;
k_inicio=0;
k_fin=1;
Ninc=100;

for i=1:Ninc
    niter = 100;
    k = k_inicio+(k_fin-k_inicio)*i/(Ninc);
    lambda = 1;%lambda_inicio+(lambda_fin-lambda_inicio)*i/(Ninc);
    opcion = 2;
    
    T1_filtrada = dif_aniso(T1,niter,k,lambda,opcion);
    Hx = fspecial('sobel');
    Hy = Hx';
    dim = size(T1_filtrada);
    Omega = dim(1)*dim(2);
    ux = double(imfilter(T1_filtrada,Hx));
    uy = double(imfilter(T1_filtrada,Hy));
    modGrad = sqrt(ux.^2+uy.^2);
    
    prior_array(i)= sum(modGrad(:))/Omega;
%     t=lambda_fin/Ninc*(1:1:i);
    t=k_fin/Ninc*(1:1:i);

    
    
    
    figure(1)
    colormap(gray);
    subplot(2,2,1);imagesc(T1d);title('Imagen original');
    subplot(2,2,3);imagesc(T1_filtrada);title('Imagen filtrada');
    subplot(2,2,[2,4]);plot(t,prior_array);grid;
    pause(0.001);
end
%% apartado 1.2
clear all; close all; clc;
disp('Practica 1: apartado 1.2')
T1 = (imread('T1.png'));
T2 = (imread('T2.png'));
T(:,:,1)=T1;T(:,:,2)=T2;

niter = 100;
k = 1;
lambda = 100;
opcion = 2;

T_filtrada = dif_aniso_multi(T,niter,k,lambda,opcion);
Hx = fspecial('sobel');
Hy = Hx';
dim = size(T_filtrada);
Omega = dim(1)*dim(2);
ux = double(imfilter(T_filtrada,Hx));
uy = double(imfilter(T_filtrada,Hy));
modGrad = sqrt(ux.^2+uy.^2);
prior= sum(modGrad(:))/Omega;


subplot(2,2,1);imshow(T1);title('T1');
subplot(2,2,2);imshow(T2);title('T2');
 colormap(gray);
subplot(2,2,3);imagesc(T_filtrada(:,:,1));title('T1 filtrada multi');
subplot(2,2,4);imagesc(T_filtrada(:,:,2));title('T2 filtrada multi');



