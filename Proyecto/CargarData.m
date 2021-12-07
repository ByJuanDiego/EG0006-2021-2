function [T] = CargarData(ruta)

T = readmatrix(ruta,'Range','C12:C730')';

end

