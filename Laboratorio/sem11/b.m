i = 6;
%for i=6:10
    
    fprintf(" ------- Polinomios de grado %d ------- \n\n", i-1)
    
    for k=1:100
        
        flag = false;
        while flag == false

            P = randi([-108 108], 1, i);
            r = roots(P);

            if isreal(r)
                
                if all(r == uint8(r))
                    
                    fprintf("\n\n")
                    
                    format rat
                    disp(P)
                    disp(r')
                    format short
                    disp(r')
                    fprintf("\n\n")
                    flag = true;
                    break;
                    
                end    
            end

        end
    end
    
%end
