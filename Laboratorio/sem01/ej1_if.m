
n = randi(100, 1)

if n<30
    X = [num2str(n), ' es menor que 30'] 
    %fprintf(num2str(n) + " es menor que 30" + "\n")

elseif n>80
    X = [num2str(n), ' es mayor que 80']
    %fprintf(num2str(n) + " es menor que 30" + "\n")

else
    X = [num2str(n), ' está entre 30 y 80']
    %fprintf(num2str(n) + " es menor que 30" + "\n")

end

disp(X) % fprintf(X+"\n")
