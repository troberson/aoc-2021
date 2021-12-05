% Advent of Code - Day 3b
% Tamara Roberson
% December 5, 2021

function value = filter_data(data, num_bits, prefer)
    assert(~isempty(data), 'Data cannot be empty.');
    assert(mod(num_bits, 1) == 0 && num_bits > 0, ...
        'Number of bits must be an integer greater than 0.');
    assert(prefer == 0 || prefer == 1, ...
        'Prefer must be 0 or 1.')

    list = data;
    pos = 1;
    while size(list,1) > 1 && pos <= num_bits
        list = filter_list(list, prefer, pos);
        pos = pos + 1;
    end

    value = bin2dec(num2str(list));
end
