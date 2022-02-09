function [number] = wordToNumber(Word)
%WORDTWONUMBER Summary of this function goes here
%   Detailed explanation goes here

switch(lower(Word))
    case('zero')
        number = 0;
    case('one')
        number = 1;
    case('two')
        number = 2;
    case('three')
        number = 3;
    case('four')
        number = 4;
    case('five')
        number = 5;
    case('six')
        number = 6;
    case('seven')
        number = 7;
    case('eight')
        number = 8;
    case('nine')
        number = 9;
    case('unknown')
        number = 100;
    otherwise
        disp("Fuck you dipshit")

end

