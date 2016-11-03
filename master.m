% master.m - script that runs long term visualization of satellite data
%	     by plotting every satellite observation as a pixel in the sky,
%	     hopefully showing the horizon surrounding the antenna.
%            Currently a work in progress.

clear; close all; clc;
% File storage information
directory = 'GridData';
outdir = 'outfiles';
D = dir([directory,'/*.mat']);
count = length(D(not([D.isdir])));
outfile = 'locMat';
picfile = 'horizon.png';
daz = .05;
del = .05;
% process each txinfo.mat to return list of times, sats, and pos data
parfor i = 1:size(D,1)
    disp(sprintf('Processing Data Set %d\n',i));
    locMat{i,:,:} = process(D(i).name,directory);
    img(i,:,:) = skyview(squeeze(locMat{i,:,:}),daz,del);
end
% Add all images together
finalImage = rot90(squeeze(sum(img,1)));
% Output
save([outdir '/' outfile datestr(now,'mmdd_HHMM')],'locMat','img','-v7.3');
imwrite(finalImage,picfile);
