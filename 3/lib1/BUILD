load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("//:manifest.bzl", "manifest")

cc_library(
    name = "object",
    srcs = ["src/lib1.c"],
    hdrs = ["hdr"],
    includes = ["hdr"],
    visibility = ["//visibility:private"],
)

pkg_tar(
    name = "objs",
    srcs = [":object"],
    mode = "0644",
    extension = "tar.gz",
    visibility = ["//visibility:private"],
)

pkg_tar(
    name = "hdrs",
    srcs = glob(["hdr/*.h"]),
    mode = "0644",
    extension = "tar.gz",
    visibility = ["//visibility:private"],
)

manifest(
    name = "release",
    srcs = [
        ":objs",
        ":hdrs"
    ],
    visibility = ["//visibility:private"],
)