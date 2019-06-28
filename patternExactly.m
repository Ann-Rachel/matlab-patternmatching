%A ist das große Array, B ist das kleine Array
%geht nur für Binärbilder
function match = patternExactly(A, B)
match = 0;
for i = 1 : size(A,1)-size(B,1)
    zeilenindex =  patternExactlyInRow(A(i,:),B(1,:));
    for n = 1 : size(zeilenindex,2)
        hilfe =  A(i: i + size(B,2)-1, zeilenindex(n): zeilenindex(n)+ size(B,2)-1);
        hilfe2 = (hilfe == B);
        hilfe3 = sum(hilfe2,'all');
        if hilfe3 == (size(B,1)*size(B,2))
            match = match+1;
        end
    end
end


