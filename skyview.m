function [ image ] = skyview(locMat,daz,del)
% skyview - take a list of positions observed and return a
%	a picture indicating where the sky if visible
%
% Inputs:
%    locMat - list of every single observation, nothing more than
%             an ordered pair of (az, el) data (degrees)
%		az1  el1
%		az2  el2
%		 .    .
%		 .    .
%		azn  eln
%
%    daz - resoloution of azimuth
%    del - resoloution of elevation
%
% Outputs:
%    image - array indicating where satellites are visible

image = zeros(floor(360/daz),floor(90/del));
for i = 1:size(locMat)
	azI = floor(locMat(i,1)/daz) + 1;
	elI = floor(locMat(i,2)/del) + 1;
	image(azI,elI) = image(azI,elI) + 1;
end
end
