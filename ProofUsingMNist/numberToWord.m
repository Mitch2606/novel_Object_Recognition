function [word] = numberToWord(number)
%WORDTWONUMBER Summary of this function goes here
%   Detailed explanation goes here

switch(number)
    case(0)
        word = 'Zero';
    case(1)
        word = 'One';
    case(2)
        word = 'Two';
    case(3)
        word = 'Three';
    case(4)
        word = 'Four';
    case(5)
        word = 'Five';
    case(6)
        word = 'Six';
    case(7)
        word = 'Seven';
    case(8)
        word = 'Eight';
    case(9)
        word = 'Nine';
    otherwise
        disp("Fuck you dipshit")

end

