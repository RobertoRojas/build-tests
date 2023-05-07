def untar(name, src, outs, dest="", **kwargs):
    fixed_out = []
    if dest != "":
        for out in outs:
            fixed_out.append("{}/{}".format(dest, out))
    else:
        fixed_out = outs
    native.genrule(
        name = name,
        srcs = [src],
        outs = fixed_out,
        cmd = "mkdir -p $(RULEDIR)/{dest} && tar -xf $< -C $(RULEDIR)/{dest}".format(dest=dest),
        **kwargs
    )