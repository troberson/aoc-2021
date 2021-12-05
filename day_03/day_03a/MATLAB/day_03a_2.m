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

    % This variation converts the text into a 1000x12 array.
    % Since each bit is stored as a 64-bit integer, this takes
    % 96 kB. Converting to a logical bit array makes it take
    % 12 kB rather than 12 kbits (1.5 kB) because each bit is aligned to a
    % byte. But to avoid the intermediate step of the 96 kB matrix would
    % require preallocating the logical array with 'false()' and testing
    % each bit. We'll tolerate the 96 kB here. With a much larger matrix,
    % we might choose to construct a logical array to save memory.
    half = length(data_cells) / 2;
    gamma_bits = sum(cell2mat(data_cells') - '0') > half;

    % MATLAB requires going through a string rather than directly
    % from a logical array to a number. This works below 'flintmax',
    % which is IEEE double max value (2^53).
    gamma = bin2dec(num2str(gamma_bits));

    num_bits = length(data_cells{1});
    mask = bitshift(1, num_bits)-1;
    epsilon = bitand(bitcmp(uint64(gamma)), mask);

    power = gamma * epsilon;
end
