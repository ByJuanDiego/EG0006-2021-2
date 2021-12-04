syms x;

g = input('\nIngrese el grado del polinomio: ');
n = input('Ingrese la cantidad de polinomios: ');
superior = input('Ingrese el límite superior (superior>1): ');
inferior = input('Ingrese el límite inferior (inferior<superior): ');

for i = 1:n
    
    P = 1;
    
    for j = 1:g
        
        R = randi([inferior superior]);
        P = P*(x+R);
        
    end
    
    R = abs(randi([1 5]))+1;
    P = P*R;
    
    fprintf("\n\nPolinomio %d:\n\n", i)
    
    disp(P);
    disp(expand(P));

    fprintf("\n\n")
    
end
