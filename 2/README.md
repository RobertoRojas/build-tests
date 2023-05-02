# Multi BUILD files

This is a build that use 2 libraries from different folders and link them to the main.c file.

## Commands

To build the application

> bazel build //:app;

To clean the application

> bazel clean;

Execute application

> ./bazel-bin/app;

## Actions

The path of the action definition is this:

> {repo}/.github/workflows/2.yml