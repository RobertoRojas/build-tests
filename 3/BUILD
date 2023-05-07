load("//:process.bzl", "process")

process(
    name = "lib1",
    objs_src = "download/lib1/objs.tar",
    hdrs_src = "download/lib1/hdrs.tar",
    objs_outs = ["libobject.a"],
    hdrs_outs = ["lib1.h"],
)

process(
    name = "lib2",
    objs_src = "download/lib2/objs.tar",
    hdrs_src = "download/lib2/hdrs.tar",
    objs_outs = ["libobject.a"],
    hdrs_outs = ["lib2.h"],
)

cc_binary(
    name = "app",
    srcs = ["main/src/app.c"],
    deps = [
        ":lib1",
        ":lib2",
    ],
)

genrule(
    name = "release",
    srcs = [":app"],
    outs = ["MANIFEST_APP.txt"],
    cmd = "wc -c $< | cut -f1 -d ' ' > $@"
)