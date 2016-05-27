test_reporting_progress_shows_dots_for_each_test() {
  assert_equals ".." "$(a_test_run_of a_module_with_2_silent_tests)"
}
test_reporting_progress_shows_F_for_each_failing_test() {
  assert_equals "F." "$(a_test_run_of a_module_with_2_silent_tests_where_one_fails)"
}
test_summarize_result_shows_success_message_with_tests_summary() {
  assert_equals "Success; tests run: '2', failed: '0'" "$(
      report_on a_silent_run_of a_test_run_of a_module_with_2_silent_tests
    )"
}
test_summarize_result_shows_failure_message_with_tests_summary_on_failure() {
  assert_equals "Failed; tests run: '2', failed: '1'" "$(
      report_on a_silent_run_of a_test_run_of a_module_with_2_silent_tests_where_one_fails
    )"
}
