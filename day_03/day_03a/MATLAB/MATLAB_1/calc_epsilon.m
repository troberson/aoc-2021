% Advent of Code - Day 3a
% Tamara Roberson
% December 4, 2021

% Epsilon is the complement of gamma. But we only need the same number of bits
% as in the original data.

function epsilon = calc_epsilon(gamma, num_bits)
    mask = bitshift(1, num_bits)-1;
    epsilon = bitand(bitcmp(uint64(gamma)), mask);
end
