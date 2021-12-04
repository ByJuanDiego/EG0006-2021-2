function [Q, R] = GS(A)

  % factorización QR
 [m, n] = size(A);
 R = zeros(n, n);
 Q=zeros(m, n);
 
 R(1,1) = norm(A(:,1));
 Q(:,1) = A(:,1)/R(1,1);
 for j =2:n
    Q(:,j) = A(:,j);
    for i = 1:j-1
       R(i,j) = (Q(:,j)')*Q(:,i);
       Q(:,j) = Q(:,j) - R(i,j)*Q(:,i);
    end
    R(j,j) = norm(Q(:,j));
    Q(:,j) = Q(:,j)/R(j,j);
 end
