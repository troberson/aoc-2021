% Advent of Code - Day 3b
% Tamara Roberson
% December 5, 2021

function day_03b()
  test_solution = 230;
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
end
