#!/bin/sh
assert_equals() {
  local expected=$1
  local actual=$2
  if [[ $expected != $actual ]]
  then
    echo "Assertion failed; expected '$expected', but was: '$actual'"
    exit 1
  fi
}

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
run_tests tests/runner_tests.sh &&
  run_tests tests/assertion_tests.sh
