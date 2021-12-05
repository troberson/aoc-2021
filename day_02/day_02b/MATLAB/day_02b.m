% Advent of Code - Day 2b
% Tamara Roberson
% December 4, 2021

test_solution = 900;
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

function mult = process_file(fname)
    tbl = readtable(fname);
    tbl.Properties.VariableNames = {'Command', 'Distance'};

    position.horiz = 0;
    position.depth = 0;
    position.aim = 0;

    for idx = 1:height(tbl)
        cmd  = tbl{idx, 'Command'};
        dist = tbl{idx, 'Distance'};
        position = update_pos(position, cmd, dist);
    end

    mult = position.horiz * position.depth;
end

function new_pos = update_pos(cur, cmd, dist)
    new_pos = cur;
    if strcmp(cmd, 'down')
        new_pos.aim = cur.aim + dist;
    elseif strcmp(cmd, 'up')
        new_pos.aim = cur.aim - dist;
    elseif strcmp(cmd, 'forward')
        new_pos.horiz = cur.horiz + dist;
        new_pos.depth = cur.depth + cur.aim * dist;
    else
        error("Unknown Command: %s", cmd);
    end
end
