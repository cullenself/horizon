% master.m - script that runs long term visualization of satellite data
%	     by plotting every satellite observation as a pixel in the sky,
%	     hopefully showing the horizon surrounding the antenna.
%            Currently a work in progress.

clear; close all; clc;
% File storage information
directory = 'txfiles';
D = dir([directory,'/*.mat']);
count = length(D(not([D.isdir])));
format = 'txinfo%d.mat';
outfile = 'locMat';
picfile = 'horizon.png';
daz = 1;
del = 1;
% process each txinfo.mat to return list of times, sats, and pos data
parfor i = 1:count
    disp(sprintf('Processing Data Set %d\n',i));
    locMat(i,:,:) = process(i,directory,format);
    img(i,:,:) = skyview(squeeze(locMat(i,:,:)),daz,del);
end
% Add all images together
finalImage = squeeze(sum(img,1));
% Output
save([outfile datestr(now,'mmdd_HHMM')],'locMat','img','-v7.3');
imwrite(finalImage,picfile);
