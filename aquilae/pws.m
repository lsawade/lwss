function [pwstack] = pws(signal,v,k)
%% 
% Phase-Weighted-Stack:
% Input:
%   S = signal matrix where each row is one trace
%   v = order of the phase-weighted-stack
%         - v = 0, linear-stack
%         - v = 2, squared-phase-stacked
%   k = k-point moving mean
%
%
% Output:
%   pwstack = one row vector with the phase weighted stack
%
% Phase weighted stacking - Schimmel and Paulsen (1997)
% With help of the Hilbert transform the function calculates the
% instantaneous phase of every element in the matrix. Then, it proceeds to
% calculate the the coherence of the traces at time t by taking the
% average of the phase expression v*abs(sum(exp(j*phase(t)))/n)^v; this is 
% the phase weight at time t. 
% Afterwards the sum of traces at time t are multiplied with the phase
% weight at time t.
%
% Added: September 9, 2020

% Number of traces
n = size(signal,1);

% Calculate the Hilbert transform
S = hilbert(signal')';

% % phase weight, inst. phase = angle(S)
phw = abs(movmean(sum(exp(1i*angle(S)),1),k)/n).^v;


% phase-weighted-stack;
pwstack = sum(signal,1)/n.*phw/max(phw);

end



