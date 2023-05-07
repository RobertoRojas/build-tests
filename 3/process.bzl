load("//:untar.bzl", "untar")

def process(name, objs_src, objs_outs, hdrs_src, hdrs_outs, **kwargs):
    objs = "{}_objs".format(name)
    hdrs = "{}_hdrs".format(name)

    untar(
        name = objs,
        src = objs_src,
        dest = "_{}".format(name),
        outs = objs_outs,
        **kwargs
    )

    untar(
        name = hdrs,
        src = hdrs_src,
        outs = hdrs_outs,
        **kwargs
    )

    native.cc_library(
        name = name,
        srcs = [":{}".format(objs)],
        hdrs = [":{}".format(hdrs)],
        includes = ["hdr"],
        linkstatic = 1,
        **kwargs
    )