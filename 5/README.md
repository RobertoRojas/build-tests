# Local/Remote dependencies

This shows one example about how to make a little improvement about the 'external bazel rules', please check the WORKSPACE.bazel and compare it with the file into the example 4 to see the changes.

The other thing done here is create two ways to get the libraries that needs the python script to run, the first one is download it from github and another is compile locally, the current example is very simple, but shows how you can management this kind of dependencies. The commands to compile are

## From github(default)

> bazel build //:release

## Compile locally

> bazel build //:release --define libraries=local