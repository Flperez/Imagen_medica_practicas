function [ out ] = transformation( in, angle, trasx, trasy)
%TRANSFORMATION Summary of this function goes here
%   Detailed explanation goes here

out = imrotate(in,angle,'bilinear','crop');
tras = [trasx trasy];
out = imtranslate(out, tras);

