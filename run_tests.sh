#!/bin/sh

run_tests() {
  local test_module=$1
  source $test_module
  local module_result=0
  for test in $(tests_in $test_module)
  do
    ( $test )
    (( module_result = module_result || $? ))
  done
  return $module_result
}
tests_in() {
  local test_module=$1
  grep ^test_ $test_module | sed -e 's/[() {]//g'
}

a_single_line_log_of() {
  $@ | xargs
}
a_test_run_of() {
  local test_module=$1
  run_tests data/$test_module.sh
}
a_silent_run_of() {
  $@ > /dev/null
}
[[ "first_run second_run" == $(a_single_line_log_of a_test_run_of a_module_with_2_tests ) ]] &&
[[ "first_run second_run" == $(a_single_line_log_of a_test_run_of a_module_with_2_tests_where_one_fails) ]] &&
[[ 1 == $(a_silent_run_of a_test_run_of a_module_with_2_tests_where_one_fails)$? ]] &&
[[ 0 == $(a_silent_run_of a_test_run_of a_module_with_2_tests)$? ]]
