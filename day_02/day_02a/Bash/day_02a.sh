#!/usr/bin/env bash

test_solution=150;
fname_test='input_test'
fname_final='input'

get_total() {
  grep $1 $fname | cut -d' ' -f2 | paste -sd+ - | bc
}

calc_pos() {
  local fname=$1
  local horiz=$(get_total 'forward')
  local depth=$(( $(get_total 'down')-$(get_total 'up') ))
  echo $(( horiz*depth ))
}

test_result=$(calc_pos $fname_test)
echo -n "Test result: $test_result"
if [ $test_result -eq $test_solution ]; then
  echo " (SUCCESS!)"
else
  echo " (FAIL)"
  exit 1
fi

echo "AoC Result: $(calc_pos $fname_final)"
