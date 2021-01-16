load test_helper

setup() {
  # source the print library before each run
  . "$LIB/print.bash"
}

@test "print_err should print one line per argument" {
  # just one argument
  run print_err FOO "hello world"

  (( status == 0 ))
  [[ "${#lines[@]}" -eq 1 ]] # the lines array has 1 element

  # three arguments
  run print_err FOO "hello world" "line two" "line three"

  (( status == 0 ))
  [[ "${#lines[@]}" -eq 3 ]] # the lines array has 3 elements
}

@test "print_err should print the prefix on each line" {
  run print_err FOO hello world "another line" "and more"

  (( status == 0 ))

  # iterate over each line and test that it contains the [FOO] prefix
  # if any iteration fails, the whole test will fail
  for line in "${lines[@]}"; do
    [[ "$line" = "[FOO] "* ]]
  done
}

@test "print_err should not output anything if SILENT_MODE is set" {
  SILENT_MODE=1

  run print_err FOO "hello world" "line two" "line three"

  (( status == 0 ))
  [[ -z "$output" ]] # no output
}

@test "warn should print with a WARN prefix" {
  run warn "testing"

  (( status == 0 ))
  [[ "$output" = "[WARN] "* ]]
}

@test "error should print with an ERROR prefix" {
  run error "testing"

  (( status == 0 ))
  [[ "$output" = "[ERROR] "* ]]
}

