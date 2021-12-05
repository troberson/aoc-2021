% Advent of Code - Day 3a
% Tamara Roberson
% December 4, 2021

% Gamma is formed by the most common bit in that position of the matrix.
% Counting characters may be faster than converting to numbers and grabbing
% bits. But I think that is more in line with the spirit of this Hamming
% weight problem.

function gamma = calc_gamma(data_cells, num_bits, half)
    data = bin2dec(data_cells);
    gamma = 0;
    for idx = num_bits:-1:1
        if sum(bitget(data, idx)) > half
            gamma = bitset(gamma, idx, 1);
        end
    end
end
