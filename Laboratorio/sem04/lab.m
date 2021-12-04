% LABORATORIO Semana 4 - Mate3 - Semestre 2021-II

% Pregunta 1

A = [1 0; 
     0 0];

KerA = null(A,'r');
fprintf('\nEl resultado de la Pregunta 1 es:\n')
fprintf('\n\t El Núcleo de T está generado por el vector:\n')
disp(KerA);

% Pregunta 4

A4 = [1  3 -2; 
     -3 -9 -6];

ImaT4 = colspace(sym(A4));
fprintf('\n\tLa imagen de T esta generada por el vector:\n')
disp(ImaT4);