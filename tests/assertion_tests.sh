assert_equals() {
  local expected=$1
  local actual=$2
  echo "Assertion failed; expected '$expected', but was: '$actual'"
}
test_assert_equals_shows_message_on_error() {
  [[ "Assertion failed; expected '0', but was: '1'" == $(assert_equals 0 1)  ]]
  [[ "Assertion failed; expected '1', but was: '2'" == $(assert_equals 1 2)  ]]
}
