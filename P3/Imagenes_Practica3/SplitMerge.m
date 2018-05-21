function [ out ] = SplitMerge( img,bajo, alto,xy)
%SPLITMERGE Summary of this function goes here
%   Detailed explanation goes here

% 
% img = imread('hueso.tif');
% alto = 200;
% bajo = 50;

% xy = [272 297];

imgLogical = bajo<img & img<alto;
stats = regionprops(imgLogical,'PixelList');
[N,~]=size(stats);
for i=1:N
    list = stats(i).PixelList;
    check = ismember(list,xy,'rows');
    if isempty(find(check, 1))== false
        ind = i;
    end
end




milista = stats(ind).PixelList;



subplot(1,2,1);
imshow(img)
hold on
plot(milista(:,1),milista(:,2),'*r');title('Imagen split/merge')
subplot(1,2,2);
imshow(256*uint8(imgLogical));title('bajo < Imagen < alto')



end

