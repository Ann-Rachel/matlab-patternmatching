% A and B are 1D arrays
% A is picture, B is pattern, output rowindices in A
% https://de.mathworks.com/matlabcentral/answers/373937-how-to-find-pattern-in-an-array
function output = patternExactlyInRow(A, B)
 SIZE = length(A) - length(B) +1;
 match = zeros(1, SIZE);
    for i=1:SIZE
        match(i) = all(A(i:i-1+length(B)) == B);
    end
    output = find(match == 1);
end
