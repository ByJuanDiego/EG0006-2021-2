function [Area] = AreaTriangulo(x1, y1, x2, y2, x3, y3);
 
 %{
    Esta función calcula el área de un triángulo.
    Recibe como parámetros 3 puntos.
 %}

 M = [
       x1 y1 1;
       x2 y2 1;
       x3 y3 1
];

Area = (1/2)*det(M);
end

