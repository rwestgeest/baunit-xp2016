#!/bin/sh

run_tests() {
  local test_module=$1
  source $test_module
  for test in $(tests_in $test_module)
  do
    $test
  done
}
tests_in() {
  local test_module=$1
  grep ^test_ $test_module | sed -e 's/[() {]//g'
}

[[ "first_run second_run" == $(run_tests data/a_module_with_2_tests.sh | xargs) ]]
