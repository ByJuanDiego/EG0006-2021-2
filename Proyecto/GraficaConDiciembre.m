function [] = GraficaConDiciembre(T, hora, P, grado, dias)
    
    TDiciembre = readmatrix('diciembre.csv','Range','C12:C263')';
    TDiciembre = TDiciembre(hora:24:end);
    
    TTotal = [T TDiciembre];
    ttotal = (0:1:length(TTotal)-1);
    
    % Graficando los puntos de la data
    plot(ttotal, TTotal, 'or', "Color", '#D95319', "LineWidth", 1)
    hold on; grid on;
    
    tt = linspace(0, 29+dias, 100);
    TT = polyval(P, tt);
    
    % Graficando el polinomio aproximante
    plot(tt, TT, 'b', "Color", '#A2142F', "LineWidth", 1.5);
    
    title(...
        "Gráfica Temperatura vs Tiempo " + int2str(hora-1) + " hrs (primeros días de diciembre)", ...
        "FontSize", 17, "FontName", "Times New Roman")

    legend(...
        "Data", ...
        "Polinomio de grado "+int2str(grado),...
        "Location", "best", ...
        "FontSize", 13, ...
        "FontName", "Times New Roman")
    
    hold off;
    
    xlim([min(tt)     max(tt)    ])
    ylim([3/4*min(T) 5/4*max(T)])

end

