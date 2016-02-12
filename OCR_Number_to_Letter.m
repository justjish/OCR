function [result_letter] = OCR_Number_to_Letter (result_classes) 
result_letter = [];
x = size(result_classes);
for i = 1:x
    x = result_classes(i);
    if (x == 1)
        result_letter=[result_letter; 'a'];
    end
    if (x == 2)
        result_letter=[result_letter; 'd'];
    end
    if (x == 3)
        result_letter=[result_letter; 'f'];
    end
    if (x == 4)
        result_letter=[result_letter; 'h'];
    end
    if (x == 5)
        result_letter=[result_letter; 'k'];
    end
    if (x == 6)
        result_letter=[result_letter; 'm'];
    end
    if (x == 7)
        result_letter=[result_letter; 'n'];
    end
    if (x == 8)
        result_letter=[result_letter; 'o'];
    end
    if (x == 9)
        result_letter=[result_letter; 'p'];
    end
    if (x == 10)
        result_letter=[result_letter; 'q'];
    end
    if (x == 11)
        result_letter=[result_letter; 'r'];
    end
    if (x == 12)
        result_letter=[result_letter; 's'];
    end
    if (x == 13)
        result_letter=[result_letter; 'u'];
    end
    if (x == 14)
        result_letter=[result_letter; 'w'];
    end
    if (x == 15)
        result_letter=[result_letter; 'x'];
    end
    if (x == 16)
        result_letter=[result_letter; 'z'];
    end
    
end