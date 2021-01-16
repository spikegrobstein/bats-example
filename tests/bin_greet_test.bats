load test_helper

@test "greet should greet Anonymous if no arguments are passed" {
  run "$bin_greet"

  echo "$bin_greet" >&2
  (( status == 0 ))
  [[ "${lines[0]}" = *WARN* ]] # first line should contain a warning
  [[ "${lines[1]}" = "Hi, Anonymous." ]] # last line should greet
}

@test "greet should greet the user that is supplied" {
  run "$bin_greet" Bob

  (( status == 0 ))
  [[ "$output" = "Hi, Bob." ]]
}

@test "greet should greet friendly when passed -f" {
  run "$bin_greet" -f Bob

  (( status == 0 ))
  [[ "$output" = "Hey there, Bob. How are you doing today?" ]]
}

@test "greet should fail if run as root" {
  # inside just this test, the PATH variable is being updated
  # so that our 'id' command overrides the one in the existing PATH
  PATH="$STUBS/always_root:$PATH"

  run "$bin_greet"

  (( status == 2 )) # script exited with a 2
  [[ "$output" = *ERROR*root* ]] # output contains 'ERROR' and 'root'
}

@test "greet should fail if passed a bad option" {
  run "$bin_greet" -x # -x is an unsupported flag

  (( status != 0 )) # status is non-zero
  [[ "$output" = *ERROR*"Invalid option:"* ]] # we got an "invalid option failure"
}

