test_data = [199 200 208 210 200 207 240 269 260 263];

test_result = count_increasing(test_data);
test_solution = 7;
test_str = "FAIL";
if (test_result == test_solution)
    test_str = "SUCCESS!";
end
fprintf("Test Result: %d (%s)\n", test_result, test_str);
assert (test_result == test_solution, "Test failed.");

data = readmatrix('../../input');
fprintf("AoC Result: %d\n", count_increasing(data));

function num_increasing = count_increasing(data)
    num_increasing = sum(diff(data) > 0);
end
