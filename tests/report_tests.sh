test_reporting_progress_shows_dots_for_each_test() {
  assert_equals ".." "$(a_test_run_of a_module_with_2_silent_tests)"
}
test_reporting_progress_shows_F_for_each_failing_test() {
  assert_equals "F." "$(a_test_run_of a_module_with_2_silent_tests_where_one_fails)"
}
