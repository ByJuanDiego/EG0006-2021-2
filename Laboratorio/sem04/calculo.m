syms x y;

f(x,y) = x*y + exp(x); % f(x,y) = xy + e^x

dx = diff(f, x);
dy = diff(f, y);

disp(dx);
disp(dy);

ix = int(f, x);
iy = int(f, y);

disp(ix);
disp(iy);