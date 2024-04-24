#!/bin/sh

# A simple wrapper to run shell tests via TEST_SHELL_PATH,
# or exec unit tests directly.

case "$1" in
*.sh)
	if test -z "${TEST_SHELL_PATH+set}" ; then
		echo "ERROR: TEST_SHELL_PATH is not set" >&2
		exit 1
	fi
	exec ${TEST_SHELL_PATH} "$@"
	;;
*)
	exec "$@"
	;;
esac
