# set this environment variable to non-zero to not print any errors
SILENT_MODE="${SILENT_MODE:-0}"

# print the given arguments to stderr, one per line with a tag
# for example: print_err WARN "this is an error" "do something"
# will output:
#  [WARN] this is an error
#  [WARN] do something
print_err() {
  if (( SILENT_MODE )); then
    # if this varialbe is non-zero, short-circuit and don't do anything
    return
  fi

  local tag="$1"; shift

  printf "[$tag] %s\n" "$@" >&2
}

# just buid on print_err to print out text to stderr with a prefix
warn() {
  print_err 'WARN' "$@"
}

error() {
  print_err 'ERROR' "$@"
}

