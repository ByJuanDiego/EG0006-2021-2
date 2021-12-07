function [xyzFinal] = RotacionR3(m, xyz)
    
    %Esta función rota el punto xyz = [x; y; z] con respecto a los
    %ángulos indicados en m = [tetha1, tetha2, theta3]
    %con respecto al eje X, Y y Z, respectivamente.
    %Los ángulos son dados en grados.
    
    ang = m/180*pi; % Angulo de rotación en radianes
    
    C = cos(ang);
    S = sin(ang);
    
    % Rotación alrededor del eje X
    Rx = [
        1    0      0  ; 
        0   C(1)  -S(1); 
        0   S(1)   C(1)
        ];
    
    % Rotación alrededor del eje Y
    Ry = [
        C(2)  0  S(2);
          0   1   0  ; 
       -S(2)  0  C(2)
       ];
    
    % Rotación alrededor del eje Z
    Rz = [
        C(3) -S(3) 0;
        S(3)  C(3) 0; 
         0     0   1
         ];
    
    xyzFinal = Rx * Ry * Rz * xyz;
    
end