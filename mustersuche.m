%Mustersuche
%0 = schwarz
%1 = weiss
%typ1 = BasicClass;
typ1.A = [0 0 ; 1 1]; %0°
typ1.B = flipud(typ1.A);  %Zeilen tauscht

typ2.A = [0 0;0 1]; %45°
typ2.B = rot90(typ2.A,2);
typ2.C = ~(typ2.A);
typ2.D = rot90(typ2.C,2);
%imshow(typ2.B);

typ3.A = rot90(typ1.A,3); %90°
typ3.B = fliplr(typ3.A); %Spalten tauscht

typ4.A = fliplr(typ2.A); %135°
typ4.B = fliplr(typ2.B);
typ4.C = fliplr(typ2.C);
typ4.D = fliplr(typ2.D);

typ5.A = [1 0; 0 1]; %45° oder 135° Typ2 oder Typ4
typ5.B = fliplr(typ5.A);

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
typ2Match = patternExactly(Muster,typ2.A) + patternExactly(Muster,typ2.B + patternExactly(Muster,typ2.C) + patternExactly(Muster,typ2.D));
typ3Match = patternExactly(Muster,typ3.A) + patternExactly(Muster,typ3.B);
typ4Match = patternExactly(Muster,typ4.A) + patternExactly(Muster,typ4.B + patternExactly(Muster,typ4.C) + patternExactly(Muster,typ4.D));
typ5Match = patternExactly(Muster,typ5.A) + patternExactly(Muster,typ5.B);
%da Typ 5 auf Typ2 und Typ4 aufgeteilt wird:
typ2Match = round(typ2Match + ((typ5Match*typ2Match)/(typ2Match+typ4Match)));
typ4Match = round(typ4Match + ((typ5Match*typ4Match)/(typ2Match+typ4Match)));

%normiertes Histogramm
AnzahlDerMuster = typ1Match+typ2Match+typ3Match+typ4Match;
y(1)= typ1Match/AnzahlDerMuster;
y(2) = typ2Match/AnzahlDerMuster;
y(3) = typ3Match/AnzahlDerMuster;
y(4) = typ4Match/AnzahlDerMuster;


x = 1:4;
figure;
bar(x,y);
xticklabels({ '0°', '45°', '90°', '135°'});
yticks(sort(unique(y)));
yticklabels({ '0.04', '0.31', '0.61'});

grid on;
xlabel('Richtung in °');
ylabel ('relative Häufigkeit');
title ('Patternmatching')

saveas(gcf,'Patternmatching.jpg');

figure;
ysort = sort(y);
ysort(2) = ysort(1) + ysort(2);
ysort(3) = ysort(2) + ysort(3);
ysort(4) = ysort(3) + ysort(4);


bar(x,ysort);
xticklabels({ '0°', '135°','45°', '90°' });
yticks([0 0.5 1]);
yticklabels({'0' '0.5' '1'});


grid on;
xlabel('Richtung in °');
ylabel ('relative Häufigkeit');
title ('kul. Histogramm')

saveas(gcf,'Patternmatchingsort.jpg');









