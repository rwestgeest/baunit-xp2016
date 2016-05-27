#!/bin/sh

test_first() {
  echo was_run
}

run_tests() {
return 0
}

[[ "was_run" == $(run_tests) ]]
