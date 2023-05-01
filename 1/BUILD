cc_library(
    name = "dependency",
    srcs = ["src/lib/dependency.c"],
    hdrs = ["src/hdr"],
    includes = ["src/hdr"],
)

cc_binary(
    name = "app",
    srcs = ["src/main/main.c"],
    deps = [":dependency"],
)