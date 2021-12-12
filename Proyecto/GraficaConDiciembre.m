function [] = GraficaConDiciembre(TNovHora, TDicHora, hora, P, grado, cant_dias)
        
    tNovHora = (0:1:29);
    tDicHora = (30:1:29+length(TDicHora));
    
    % Graficando los puntos de la data de noviembre
    plot(tNovHora, TNovHora, 'o', "LineWidth", 1, Color='#D95319')
    hold on; grid on;
    
    % Graficando los puntos de la data de diciembre
    plot(tDicHora, TDicHora, 'o', "LineWidth", 1, Color='#0072BD')
    
    tt = linspace(0, 29+cant_dias, 100);
    TT = polyval(P, tt);
    
    % Graficando el polinomio aproximante
    plot(tt, TT, "LineWidth", 1.5, Color='#7E2F8E');
    
    title(...
        "Gráfica Temperatura vs Tiempo " + int2str(hora-1) + " hrs (primeros días de diciembre)", ...
        "FontSize", 17, "FontName", "Times New Roman")
    
    legend(...
        "Data Noviembre", ...
        "Data Diciembre", ...
        "Polinomio de grado "+int2str(grado),...
        "Location", "best", ...
        "FontSize", 13, ...
        "FontName", "Times New Roman")
    
    hold off;
    
    %tTotal = [tNovHora tDicHora];
    %TTotal = [TNovHora TDicHora];
    %xlim([min(tTotal)        max(tTotal)])
    %ylim([3/4*min(TTotal) 5/4*max(TTotal)])
    
end

