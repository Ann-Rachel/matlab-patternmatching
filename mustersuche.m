% matlab2019a
% Anh Thu Nguyen
% 28.06.2019
% looking for pattern typ1 in array Muster (overlap)
% size of Muster is 16x16 an pattern typ1 is 2x2

%0 = black
%1 = white
typ1.A = [0 0 ; 1 1];
typ1.B = flipud(typ1.A); 

Muster = [ 1 1 0 0 1 1 1 0 0 0 0 1 1 1 1 1;
           1 0 0 1 1 1 0 0 0 0 1 1 1 1 1 0;
           0 0 1 1 1 0 0 0 0 1 1 1 1 1 0 0;
           0 0 1 1 1 0 0 0 1 1 1 0 0 0 0 0;
           0 1 1 1 1 0 0 1 1 1 1 0 0 0 0 0;
           1 1 1 1 0 0 0 1 1 1 1 0 0 1 0 0;
           1 1 1 1 0 0 0 1 1 1 1 0 0 1 0 1;
           1 1 1 1 0 0 1 1 1 1 0 0 0 0 1 1;
           1 1 1 1 0 0 1 1 1 1 0 0 0 1 1 1;
           1 1 1 0 0 0 1 1 1 1 0 0 0 1 1 1;
           1 1 0 0 0 0 1 1 1 1 0 0 0 1 1 1;
           1 1 0 0 0 0 1 1 1 0 0 0 1 1 1 1;
           1 1 0 0 0 0 1 1 1 0 0 0 1 1 1 1;
           1 0 0 0 0 1 1 1 1 0 0 0 1 1 1 0;
           1 0 0 0 1 1 1 1 1 0 0 1 1 1 0 0;
           1 0 0 0 1 1 1 1 0 0 0 1 1 0 0 0;];

typ1Match = patternExactly(Muster,typ1.A) + patternExactly(Muster,typ1.B);
% typ1Match = 2







