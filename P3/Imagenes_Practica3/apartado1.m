clear all; close all;

img = imread('hueso.tif');
alto = 200;
bajo = 50;

xy = [272 297];
imgLogical = bajo<img & img<alto;
stats = regionprops(imgLogical,'PixelList');
% listPixel = extractfield(stats,'PixelList');
% [N,~]=size(stats);
% for i=1:N
%     list = stats(i).PixelList;
%     check = ismember(list,xy,'rows');
%     if isempty(find(check, 1))== false
%         ind = i;
%     end
% end
% 
% milista = stats(ind).PixelList;
% imshow(img)
% hold on
% plot(milista(:,1),milista(:,2),'*r');
% 
