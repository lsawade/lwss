function printkestrel(inputfile)
%PRINTKESTREL Prints figure to file containing the 
%   ouputs Plot of Kestrel data file
%
%
% Last modified: Lucas Sawade (03.09.2020)

% This function also writes a file to your current dir
[t, d] = drop2mat(inputfile);

tmin = min(t);
tmax = max(t);
td = datestr(today(), 29);

% Plot Temperature figure
f = figure();

% Cosmetic changes
set(gca,'linewidth', 1.5)
lw = 1.5;
fs = 13;
ts = 14;
fw = 'bold';

% Temperature on the left
yyaxis left;
p(1) = plot(t, d.Temperature, "LineWidth", lw);
xl(1) = xlabel('Data/Time');
yl(1) = ylabel('Temperature [\circ]', 'Fontsize', fs, 'FontWeight', 'bold');

% Humidity on the right
yyaxis right;
p(2) = plot(t, d.RelativeHumidity, "LineWidth", lw);
yl(2) = ylabel('Relative Humidity [%]', 'Fontsize', fs, 'FontWeight', 'bold');

% 
title(sprintf("Data from %s to %s", datestr(tmin,31), datestr(tmax, 31)), ...
      'Fontsize', ts, 'FontWeight', 'bold');

% Make it fit the plot
axis tight

% Set figure size
setfiguresize(f)

% Device_start_end_filecreation.pdf
filename = sprintf('kestrel_s%s_e%s_t%s.pdf', ...
                   datestr(tmin, 30), datestr(tmin, 30), td);
print(filename, "-dpdf")

% close(f)

end

