#!/bin/sh

test_first() {
  echo first_run
}
test_second() {
  echo second_run
}

run_tests() {
  test_first
  test_second
}

[[ "first_run second_run" == $(run_tests | xargs) ]]
