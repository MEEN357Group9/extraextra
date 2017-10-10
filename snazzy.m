n=3;

A = randi(10,n);
b = [2; 3; 4];

L = zeros(n);
U = eye(n);

TermL = zeros(1);
TermU = zeros(1);

for k = 1:n
    for i = k:n
        for m = 1:k-1
            TermL(m) = L(i,m)*U(m,k);
        end
        L(i,k) = A(i,k) - sum(TermL);
    end
    for j = k+1:n
        for m = 1:k-1
            TermU(m) = L(k,m)*U(m,j);
        end
        U(k,j) = (A(k,j) - sum(TermU))/L(k,k);
    end
end
        