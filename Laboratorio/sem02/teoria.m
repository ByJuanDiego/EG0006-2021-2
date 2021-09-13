%{

    Operaciones elementales de matrices: 
    Consiste en realizar operaciones en la matriz que resulten en
    un sistema de ecuaciones lineales equivalente al original.

    1. Intercambiar la fila iésima con la jésima de la matriz.
        
            fi <-> fj

    2. Sumarle la fila jésima por el multiplicador a cada elemento de la
       fila iésima
            
            fi -> f(i) + λ*f(j); λ = -[f(i,k)/f(j,j)]

    3. Multiplicar la fila iésima por un multiplicador
            
            fi -> λfi; λ!=0

    rref() -> calcula la forma escalonada de una matriz.
%}





%{

     Método de eliminación de Gauss Jordan:
     Utiliza las operaciones elementales para llegar a una matriz
     triangular superior que resuelva el sistema de ecuaciones lineales.

     Con pivoteo:
        
        Antes de calcular el multiplicador, buscar el pivote que tenga
        mayor |A(i,k)| en la columna k, y aplicar la operación elemental 
        de intercambio entre la fila iésima (fi) y la fila con pivote de 
        mayor módulo.

%}