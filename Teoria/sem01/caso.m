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

%{
    
    Para calcular la cantidad de contactos indirectos:
    C = A*B.

    Justificación:

    Para hallar el elemento (i,j) de la matriz C:

        C(i,j) = A(i,1)*B(1,j) + A(i,2)*B(2,j) + ... + A(i,n)*B(n,j)

    Por cada individuo (columna de contagios) del grupo B, se multiplica
    por la fila j del grupo A, y al sumarlo de halla el número de contagios
    indirectos
%}



ContactosIndirectos = A*B;
n = sum(sum(ContactosIndirectos));
fprintf("La cantidad de contactos indirectos entre el grupo 1 y el grupo b son: %d\n\n", n)
fprintf("Tabla de contactos indirectos:\n\n")
disp(ContactosIndirectos)

for i = 1:4
    for j = 1:5
        fprintf("La persona nº%d del grupo 1 tuvo ", i);
        fprintf("%d contactos indirectos con ", ContactosIndirectos(i, j));
        fprintf("con la persona nº%d del grupo B\n", j);
    end
end
