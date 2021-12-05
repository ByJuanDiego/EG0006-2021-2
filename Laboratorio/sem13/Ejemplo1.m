syms y(x) x

f = @(x, y) 0.25 - (7.5*y)/(1000 + (10-7.5)*x);

y(x)=dsolve(diff(y,x)==f(x,y), y(0)==25);
SolEx=inline(subs(y(x)),'x')

Q = [0.882 -0.5019 0.3225;
     0.4832 0.2415 -0.5316;
     0.2487 0.5905 -0.378;
     0.1427 0.6421 -0.1693;
     0.0932 0.6129 -0.6647;
];

R = [
    10.9489 4.2602 1.7898;
    0 1.2029 1.3177;
    0 0 0.2434
];