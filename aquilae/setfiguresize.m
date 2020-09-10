function setfiguresize(f)
%SETFIGURESIZE setfiguresize(f)
%
% Sets figure size for PDF output automatically
%
% INPUT:
%
% f     figure handle
% 
% Last edited: Lucas Sawade 03.09.2020 (15:40 EST)

set(f,'Units','Inches');
pos = get(f,'Position');
set(f,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

end

