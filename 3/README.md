# Segmented build

This example is a little bit more complicated, this have three BUILD files, but two of them are the same. The idea of this example is how to build the libraries from anothe job and consume the result to create the final application. The two types of BUILD files are:

## Lib

The lib process follow these steps:

- Build the _c_ code.
- Compress the _.a_ file
- Compress the _.h_ file
- Create a manifest and consume the both compressed files

You can notice that the [BUID for lib1](./lib1/BUILD) and [BUID for lib2](./lib2/BUILD) is basically the same content, only changing the paths. You can reduce the amount of repetitive tasks using a [MACRO](./process.bzl).

## Main

To build this application is mandatory have the _.tar.gz_ on these paths:

- download/lib1/hdrs.tar
- download/lib1/objs.tar
- download/lib2/hdrs.tar
- download/lib2/objs.tar

Is posible to create customs rules in order to execute some commands, like [BUILD#89](./BUILD), but sometimes you need to pre-process some arguments like [untar.bzl](./untar.bzl) or reduce the repetitive code wrapping different rules like [process.bzl](./process.bzl).

## Commands

### Build lib1

> bazel build //lib1:release

### Build lib2

> bazel build //lib2:release

### Build app

> bazel build //:release

## Actions

The path of the action definition is this:

> {repo}/.github/workflows/3.yml

**Note:** Be carefull, the versions of the tools inside of the github container can change the parameters of the rules, causing issues to build. 