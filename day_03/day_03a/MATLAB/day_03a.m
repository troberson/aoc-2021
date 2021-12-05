% Advent of Code - Day 3a
% Tamara Roberson
% December 4, 2021

clear

test_solution = 198;
fname_test = 'input_test';
fname_final = 'input';

test_result = process_file(fname_test);
test_str = "FAIL";
if (test_result == test_solution)
    test_str = "SUCCESS!";
end
fprintf("Test Result: %d (%s)\n", test_result, test_str);
assert (test_result == test_solution, "Test failed.");

fprintf("AoC Result: %d\n", process_file(fname_final));

function power = process_file(fname)
    data_cells = strsplit(fileread(fname), {'\r', '\n'});

    % Counting characters may be faster than converting to numbers
    % and grabbing bits. But I think that is more in line with the
    % spirit of this Hamming weight problem.

    data = bin2dec(data_cells);

    % Gamma is formed by the most common bit in that position of the
    % matrix.
    half = length(data) / 2;
    gamma = 0;
    num_bits = length(data_cells{1});
    for idx = num_bits:-1:1
        if sum(bitget(data, idx)) > half
            gamma = bitset(gamma, idx, 1);
        end
    end

    % Epsilon is the complement of gamma. But we only need the same
    % number of bits as in the original data.
    mask = bitshift(1, num_bits)-1;
    epsilon = bitand(bitcmp(uint64(gamma)), mask);

    % Power (the result) is the product of gamma and epsilon.
    power = gamma * epsilon;
end
