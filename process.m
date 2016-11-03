function [ plotMat ] = process( t, directory, format )
% process - helper function called to ingest a txinfo.mat file
%		and return a matrix ready to pass to plotsat
%
% Inputs:
%    t - variable that defines which file to read
%    format - how the log file names are formatted
%    directory - string, where the log files are stored
%
% Outputs:
%    plotMat - terrible, terrible matirx with horrid formatiing
% 	conditions, likely going to be eliminated in rewrite

% Find out which satellites were actually observed
dat = load([directory '/' sprintf(format,t)]);
txinfo = dat.txinfo;%';
% data.sats = unique(txinfo(:,8));
% 
% % Grab actual data
% for i = 1:size(txinfo)
%     data.pos(i).az = txinfo(i,4);
%     data.pos(i).el = txinfo(i,5);
%     data.pos(i).time = txinfo(i,2);
%     data.pos(i).SVID = txinfo(i,8);
% end
% data.times = unique([data.pos.time]);

times = unique(txinfo(2,:));
sats = unique(txinfo(8,:));
Nsv = numel(sats);
plotMat = zeros(Nsv*numel(times),4); % set up plotMat
parfor t = 1:max(size(times)) % loop through times
    for s = 1:Nsv % loop through satellites
        n = find(txinfo(2,:) == times(t) & txinfo(8,:) == sats(s));
        if ~isempty(n) % if satellite n was observed at t
            elRad = deg2rad(txinfo(5,n(1))); % read relevant data
            azRad = deg2rad(txinfo(4,n(1)));
        else % if unobserved
            elRad = 0;
            azRad = 0;
        end
        temp(t,s,:) = [sats(s), times(t), elRad, azRad];
    end
end
for t = 1:max(size(times))
    for s = 1:Nsv
        plotMat((t-1)*Nsv+s,:) = temp(t,s,:);
    end
end
end

