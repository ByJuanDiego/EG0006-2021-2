%{
    4 personas (grupo 1) han contraído una enfermedad y entran en contacto con 6
    personas del grupo A.
%}

A = [
    0 1 0 0 1 0;
    1 0 0 1 0 1;
    0 0 0 1 1 0;
    1 0 0 0 0 1
]; % dimensiones 4x6
%{
    Cada columna representa una persona del grupo A.
    
    A(i,j) = {

       1: si el la i-ésima persona del grupo 1 tuvo contacto con la j-ésima
       persona del grupo A.

       0: caso contrario

    }
    
    ejemplo: 

        La cuarta persona del grupo A tuvo contacto con la segunda y
        tercera persona del grupo 1.
    
%}

%{
    Cinco personas (grupo B) entran en contacto con el grupo A.
%}
B = [
    0 0 1 0 1;
    0 0 0 1 0;
    0 1 0 0 0;
    1 0 0 0 1;
    0 0 0 1 0;
    0 0 1 0 0
]; % dimensiones 6x5
