% Advent of Code - Day 3b
% Tamara Roberson
% December 5, 2021

function rating = process_file(fname)
    assert(~isempty(fname), 'Filename cannot be blank.');

    file_text = fileread(fname);
    assert(~isempty(file_text), 'Unable to read file.');

    data_cells = strsplit(file_text, {'\r', '\n'});
    num_bits = length(data_cells{1});

    data = cell2mat(data_cells') - '0';

    oxygen = filter_data(data, num_bits, 1);
    co2    = filter_data(data, num_bits, 0);

    fprintf("Oxygen: %d\n", oxygen)
    fprintf("CO2: %d\n", co2)
    rating = oxygen * co2;
end
