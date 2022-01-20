function d=dellipse_tvs(p,xc,yc,a,b)

%   Copyright (C) 2004-2012 Per-Olof Persson. See COPYRIGHT.TXT for details.

d=(p(:,1)-xc).^2/a^2+(p(:,2)-yc).^2/b^2-1;