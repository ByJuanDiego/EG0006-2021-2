function [P] = GraficaNewton(t, T, grado)
    
    % Polinomio de interpolación de Newton
    P = PolinomioNewton(t', T', grado); 
    
    tt = linspace(0, length(t)-1, 1000);
    TT = polyval(P, tt);
    
    plot(t, T,'o',Color='#D95319', LineWidth=1)
    grid on, hold on;
    
    plot(tt, TT, Color='#7E2F8E', LineWidth=1.5)
    hold off;
    
    xlim([min(t)     max(t)    ])
    ylim([3/4*min(T) 5/4*max(T)])
    
    title("Polinomio Interpolante de Newton de Grado " + int2str(grado) ...
        , "FontSize", 17 ...
        , "Interpreter", "latex")
    
    legend(...
        "Data", ...
        "Polinomio de Newton",...
        "Location", "best", ...
        "FontSize", 13, ...
        "FontName", "Times New Roman")

    xlabel(...
        "Tiempo (Días)", ...
        "FontSize", 15, "FontName", "Times New Roman")
    
    ylabel(...
        "Temperatura (˚C)", ...
        "FontSize", 15, "FontName", "Times New Roman" )
    
end