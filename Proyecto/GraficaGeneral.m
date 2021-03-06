function [] = GraficaGeneral(T, t)

plot(t, T, '.')
hold on;
plot(t, T, 'LineWidth', 0.5)
xlim([min(t)     max(t)    ])
ylim([3/4*min(T) 5/4*max(T)])
title("Gráfica Temperatura vs Tiempo (mes de noviembre)")
xlabel("Tiempo (horas)")
ylabel("Temperatura (°C)")

end

