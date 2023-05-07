def manifest(name, srcs, manifest_file="MANIFEST.txt", **kwargs):
    native.genrule(
        name = name,
        srcs = srcs,
        outs = [manifest_file],
        cmd = "date > $@",
        **kwargs
    )