%A and B are 1D arrays
%B is picture, A is pattern, output rowindices in A
function output = patternExactlyInRow(B, A)
 SIZE = length(B) - length(A) +1;
 match = zeros(1, SIZE);
    for i=1:SIZE
        match(i) = all(B(i:i-1+length(A)) == A);
    end
    output = find(match == 1);
end
