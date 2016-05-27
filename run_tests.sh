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
report_progress() {
  local result=$1
  if [[ $result != 0 ]]
  then
    printf "F"
  else
    printf "."
  fi
}
report_on() {
  tests_run=0
  tests_failed=0
  $@
  if [[ $tests_failed != 0 ]]
  then
    echo "Failed; tests run: '$tests_run', failed: '$tests_failed'"
  else
    echo "Success; tests run: '$tests_run', failed: '$tests_failed'"
  fi
}
run_tests() {
  local test_module=$1
  source $test_module
  local module_result=0
  for test in $(tests_in $test_module)
  do
    (( tests_run += 1 ))
    ( $test )
    local test_result=$?
    report_progress $test_result
    [[ $test_result != 0 ]] && (( tests_failed += 1 ))
    (( module_result = module_result || $test_result ))
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
run_all_tests() {

run_tests tests/runner_tests.sh &&
  run_tests tests/assertion_tests.sh &&
  run_tests tests/report_tests.sh
}

report_on run_all_tests
