---
applyTo: "**"
---

To source or create a Python virtual environment, use the `psrc` command. It is
a bash function available to you that enables the venv in the current shell. It
takes care of creating it and installing dependencies if the directory does not
already exist.

Before importing GitHub Actions action, always lookup their README to know the
latest stable version.

When I say "problem" I refer to IDE warnings/errors.

Avoid using regex when string comparisons are simple enough. Prefer making an
helper function and use combinations of str.lower(), str.startswith(),
str.split(), to perform the matching. Only use regex when the pattern is very
complex.
