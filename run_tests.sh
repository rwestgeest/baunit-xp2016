#!/bin/sh

test_first() {
  echo was_run
}

run_tests() {
  test_first
}

[[ "was_run" == $(run_tests) ]]
