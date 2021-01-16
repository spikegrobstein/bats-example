# BATS example

This is a super-contrived example for writing tests using [bats](https://github.com/bats-core/bats-core) to
illustrate how to test library code and commandline executable code.

It demonstrates the following techniques:

 * testing status codes
 * testing contents of output
 * testing number of lines of output
 * testing for no output
 * stubbing external executables
 * overriding environment variables
 * using test helpers

Hopefully this will be of some help to someone, somewhere.

## Running tests

To run the tests in this repo, make sure you have `bats` installed and run `bats tests`:

```console
$ bats tests/
 ✓ greet should greet Anonymous if no arguments are passed
 ✓ greet should greet the user that is supplied
 ✓ greet should greet friendly when passed -f
 ✓ greet should fail if run as root
 ✓ greet should fail if passed a bad option
 ✓ print_err should print one line per argument
 ✓ print_err should print the prefix on each line
 ✓ print_err should not output anything if SILENT_MODE is set
 ✓ warn should print with a WARN prefix
 ✓ error should print with an ERROR prefix

10 tests, 0 failures

```

## Author

This repo was created by Spike Grobstein <me@spike.cx> and does not contain any proprietary code or, anything
useful, really, and should be used for the sole purpose of illustrating how to write tests with `bats`.

## License

This repo is licensed under the MIT license. See `LICENSE` file for details.

