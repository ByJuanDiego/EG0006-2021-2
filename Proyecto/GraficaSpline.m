function [t, T, T1, T2] = GraficaSpline(T, hora, grado)
    
    T = T(hora:24:end);
    t = (0:1:length(T)-1);
    
    P = QRGramSchmidt(t, T, grado); % Polinomio de Mínimos cuadrados resuelto por QR
    
    tt = linspace(0, length(t)-1, 1000);
    Pt = polyval(P, tt);
    
    % Gráfica de la data
    plot(t, T, 'o', "Color", '#D95319', "LineWidth", 1)
    grid on, hold on
    
    % Gráfica del polinomio de mínimos cuadrados resuelto por QR
    plot(tt, Pt, "Color", '#A2142F', "LineWidth", 1.5)
    
    % Gráfica del Spline Cúbico Natural
    [T1, T2] = SplineCubicoNatural(t, T, '#0072BD');
    
    xlim([min(t)     max(t)    ])
    ylim([3/4*min(T) 5/4*max(T)])
    hold off
    
    legend(...
        "Data", ...
        "Polinomio de grado "+int2str(grado)+", R^2 = "+num2str(FactorR2(t, T, grado)), ...
        "Spline cúbico natural", ...
        "Location", "best", ...
        "FontSize", 13, ...
        "FontName", "Times New Roman")
    
    xlabel(...
        "Tiempo (Días)", ...
        "FontSize", 15, "FontName", "Times New Roman")
    
    ylabel(...
        "Temperatura (˚C)", ...
        "FontSize", 15, "FontName", "Times New Roman" )
    
    title(...
        "Gráfica Temperatura vs Tiempo (" + int2str(hora-1) + " hrs)", ...
        "FontSize", 17, "FontName", "Times New Roman")
    
end
