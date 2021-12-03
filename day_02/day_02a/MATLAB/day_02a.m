% Advent of Code - Day 2a
% Tamara Roberson
% December 2, 2021

test_solution = 150;
fname_test = 'input_test';
fname_final = 'input';

test_result = calc_pos(fname_test);
test_str = "FAIL";
if (test_result == test_solution)
    test_str = "SUCCESS!";
end
fprintf("Test Result: %d (%s)\n", test_result, test_str);
assert (test_result == test_solution, "Test failed.");

fprintf("AoC Result: %d\n", calc_pos(fname_final));

function mult = calc_pos(fname)
    tbl = readtable(fname);
    tbl.Properties.VariableNames = {'Command', 'Distance'};
    
    get_total = @(cmd) sum(tbl{strcmp(tbl.Command, cmd), 'Distance'});
    
    horiz = get_total('forward');
    depth = get_total('down') - get_total('up');
    mult = horiz * depth;
end
