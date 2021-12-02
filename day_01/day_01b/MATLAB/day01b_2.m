% Advent of Code - Day 1b
% Tamara Roberson
% December 1, 2021

% This vectorized solution uses Hankel matrix.
% A Hankel matrix is one in which the skew diagonals are constant
% Example:
%   a b c d e
%   b c d e f
%   c d e f g
%   d e f g h
%   e f g h i
% https://en.wikipedia.org/wiki/Hankel_matrix
%
% - Use a three item window to generate the index numbers in a
%   2000x3 matrix.
% - Get the associated data for each index.
% - Sum the rows (dimension 2).
% - Find the difference between each successive entry.
% - Filter (create a logical array) those that increased.
% - Count the number of increases.

test_data = [199 200 208 210 200 207 240 269 260 263];
test_result = count_increasing_window(test_data, 3);
test_solution = 5;
test_str = "FAIL";
if (test_result == test_solution)
    test_str = "SUCCESS!";
end
fprintf("Test Result: %d (%s)\n", test_result, test_str);
assert (test_result == test_solution, "Test failed.");

data = readmatrix('../../input');
fprintf("AoC Result: %d\n", count_increasing_window(data, 3));

function num_increasing = count_increasing_window(data, size)
    cols = length(data);
    rows = cols - size + 1;
    num_increasing = sum(diff(sum(data(hankel(1:rows, rows:cols)), 2)) > 0);
end
