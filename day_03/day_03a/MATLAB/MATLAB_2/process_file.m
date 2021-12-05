% Advent of Code - Day 3a
% Tamara Roberson
% December 4, 2021

function power = process_file(fname)
    data_cells = strsplit(fileread(fname), {'\r', '\n'});
    num_bits = length(data_cells{1});
    half = length(data_cells) / 2;

    gamma = calc_gamma(data_cells, half);
    epsilon = calc_epsilon(gamma, num_bits);

    % Power (the result) is the product of gamma and epsilon.
    power = gamma * epsilon;
end

