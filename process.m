function [ locMat ] = process( file, directory )
% process - helper function called to ingest a txinfo.mat file
%		and return a matrix ready to pass to plotsat
%
% Inputs:
%    file - what file to read
%    directory - string, where the log files are stored
%
% Outputs:
%    locMat - list of every single observation, nothing more than
%             an ordered pair of (az, el) data.
%		az1  el1
%		az2  el2
%		 .    .
%		 .    .
%		azn  eln

% Find out which satellites were actually observed
dat = load([directory '/' file]);
txinfo = dat.txinfo';
% data.sats = unique(txinfo(:,8));
n = size(txinfo,1);
locMat = NaN(n,2);
locMat(:,1) = txinfo(:,4); % azimuth
locMat(:,2) = txinfo(:,5); % elevation
% Now, this will probably need some filtering in the long run,
% i.e. satellites reporting unhealthy, and bad locs should be
% trimmed, or at least marked. But to simply generate a prototype
% image of the horizon, this will work.
% Exhibit a) there are negative elevation angles
locMat = locMat(locMat(:,2)>=0,:);
