%A und B sind Zeilenmatrix
%B ist Bild, A ist das Muster, output gibt Zeilen index in A aus
function output = patternExactlyInRow(B, A)
 SIZE = length(B) - length(A) +1;
 match = zeros(1, SIZE);
    for i=1:SIZE
        match(i) = all(B(i:i-1+length(A)) == A);
    end
    output = find(match == 1);
end