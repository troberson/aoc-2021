% Advent of Code - Day 1b
% Tamara Roberson
% December 1, 2021

% This is a straightforward iterative solution.
% - Keep a count of the number of times we've increased.
% - Start the previous total at -1.
% - Loop through indices from the start to the last end (end-2).
% - Sum the three values.
% - If we're not on the first window,
%    + Add the logical comparison of total > previous total (i.e. 0 or 1)
%      to the counter.
% - Set the previous total to be the current total.

test_data = [199 200 208 210 200 207 240 269 260 263];
test_result = count_increasing_window(test_data, 3);
test_solution = 5;
test_str = "FAIL";
if (test_result == test_solution)
    test_str = "SUCCESS!";
end
fprintf("Test Result: %d (%s)\n", test_result, test_str);
assert (test_result == test_solution, "Test failed.");

v = readmatrix('../../input');
fprintf("AoC Result: %d\n", count_increasing_window(v, 3));

function num_increasing = count_increasing_window(v, size)
    num_increasing = 0;
    prev_tot = -1;
    for start = 1:length(v)-size+1
        tot = sum(v(start:start+size-1));
        if (prev_tot > 0)
            num_increasing = num_increasing + (tot > prev_tot);
        end
        prev_tot = tot;
    end
end
