% Advent of Code - Day 3a
% Tamara Roberson
% December 4, 2021

% This variation converts the text into a 1000x12 array.
% Since each bit is stored as a 64-bit integer, this takes
% 96 kB. Converting to a logical bit array makes it take
% 12 kB rather than 12 kbits (1.5 kB) because each bit is aligned to a
% byte. But to avoid the intermediate step of the 96 kB matrix would
% require preallocating the logical array with 'false()' and testing
% each bit. We'll tolerate the 96 kB here. With a much larger matrix,
% we might choose to construct a logical array to save memory.

% MATLAB requires conversion from a logical array to a number to go through a
% string rather than directly. This works below 'flintmax', which is IEEE
% double max value (2^53).

function gamma = calc_gamma(data_cells, half)
    gamma_bits = sum(cell2mat(data_cells') - '0') > half;
    gamma = bin2dec(num2str(gamma_bits));
end
