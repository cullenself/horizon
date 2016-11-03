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
outfile = 'plotMat';
% process each txinfo.mat to return list of times, sats, and pos data
parfor i = 1:count
    plotMat(i,:,:) = process(i,directory,format);
end
% Old data processing - yet another reason to rewrite plotsat
% times = [data.times];
% sats = unique([data.sats]);
% Nsv = numel(sats);
% plotMat = zeros(count,numel(times)*numel(sats),4);
% for i = 1:count
%     for t = 1:size(data(i).times)
%         for s = 1:Nsv
%             n = find([data(i).pos([data(i).pos.time] == data(i).times(t)).SVID] == sats(s));
%             if ~isempty(n)
%                 elRad = deg2rad(data(i).pos(n(1)).el);
%                 azRad = deg2rad(data(i).pos(n(1)).az);
%             else
%                 elRad = 0;
%                 azRad = 0;
%             end
%             plotMat(i,(t-1)*Nsv+s,:) = [sats(s), data(i).times(t), elRad, azRad];
%         end
%     end
% end
save([outfile datestr(now,'mmdd_HHMM')],'plotMat'); % this line has never been executed
plotsat(plotMat(1,:,:),1920,0);
