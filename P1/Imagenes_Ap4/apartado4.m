clear; close all;clc;
disp('Practica 1: apartado 4')

path_in = '/home/f/URJC/URJC/imagen_medica/practicas/P1/Imagenes_Ap4';
list_name = dir(path_in);
extension = 'dcm';

imgTE=zeros([256,256,8]);
k=1;
for i=1:length(list_name)
    file = list_name(i).name;
    path_file = strcat(path_in,filesep,file);

if contains(file,extension)== 1
    
    imgTE(:,:,k)= dicomread(path_file);
    k=k+1;

end

end

X=[20,35,40,60,70,80,105,140]';
[M,N,P]=size(imgTE);
B = zeros(M,N);
for i=1:M
    for j=1:N
        fprintf('\rM: %d  N: %d',i,j);
        Y = reshape(imgTE(i,j,:),P,[]);
        f = fit(X,Y,'exp1');
        B(i,j) = f.b;
    end
end

colormap(gray)
imagesc(B);title('Imagen con los terminos B')


