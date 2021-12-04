function [bool] = RadioEspectral(T)

    rho = max(abs(eig(T))); %radio espectral
    
    if rho < 1
        bool = true;
        fprintf("ρ(T) < 1, por lo que el método es convergente\n")
    else
        bool = false;
        fprintf("ρ(T) ≥ 1, por lo que el método no es convergente\n")
    end

end
