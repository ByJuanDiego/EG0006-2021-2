T = readmatrix('data.csv','Range','C12:C730')'; % Temperatura (C)
t = (0:1:length(T)-1);                          % Tiempo (horas)

plot(t, T, 'b');
xlim([min(t) max(t)]);

title("Gráfica Temperatura vs Tiempo")
xlabel("Tiempo (horas)")
ylabel("Temperatura (°C)")
