% Advent of Code - Day 3b
% Tamara Roberson
% December 5, 2021

% This relies upon the puzzle constraint that the oxygen generator rating
% prefers '1' in case of tie and also wants the most common value. The
% CO2 rating prefers '0' and wants the least common value.

function list = filter_list(list, prefer, pos)
    assert(~isempty(list), 'List cannot be empty.');
    assert(prefer == 0 || prefer == 1, ...
        'Prefer must be 0 or 1.');
    assert(mod(pos, 1) == 0 && pos > 0, ...
        'Position must be an integer at least 1.');

    half = size(list, 1) / 2;
    total = sum(list(:,pos));
    select = total >= half;

    if prefer == 0
        select = ~select;
    end

    list = list(list(:, pos) == select, :);

    if total == half
        list = [list; list(list(:, pos) == prefer, :)];
        list = unique(list, 'rows');
    end
end
