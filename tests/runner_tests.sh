test_runner_runs_tests_in_module() {
  [[ "first_run second_run" == $(a_single_line_log_of a_test_run_of a_module_with_2_tests ) ]]
}
test_runner_runs_all_tests_even_if_one_fails() {
  [[ "first_run second_run" == $(a_single_line_log_of a_test_run_of a_module_with_2_tests_where_one_fails) ]]
}
test_runner_returns_one_on_failure() {
  [[ 1 == $(a_silent_run_of a_test_run_of a_module_with_2_tests_where_one_fails)$? ]]
}
test_runner_returns_zero_on_success() {
  [[ 0 == $(a_silent_run_of a_test_run_of a_module_with_2_tests)$? ]]
}
