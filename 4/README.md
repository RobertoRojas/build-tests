# Build variants and external rules

This is the last example to develop, I know that this tools is enough powerfull to perform more, but for the moment probably this is enough. This is the list of topics:

- How to use the bazelrc file
- How to define diferent variants
- How to handle external bazel rules

## How to use the bazelrc file

This file help you to define some general or particular arguments into your build. With this you will be able to reduce the size of the command to execute in your development tasks:

- [file](./.bazelrc)

In general the rule is define the command and the configuration profile:

```Bash
command:profile --argument '';
```

If you don't use any profile, it will apply the change in any command executed of that type. In this example you can use any of these commands:

> bazel build //:app --config=development

> bazel build //:app --config=preint

> bazel build //:app --config=release

> bazel build //:app --copt="-DVERSION=0.0.1"

The last one will overwrite the default copt argument.

To know more about this, check the offical documentation:

- [Documentation](https://bazel.build/run/bazelrc)

## How to define diferent variants

You can use preprocesor conditional in order to build you code for different variants, like this:

```C
#include <stdio.h>

#include "operation.h"

void operation(void)
{
#ifdef PRO
    printf("The operation is done :D\n");
#else
    printf("The operation is done, but is slow. Pay for the pro option >:)\n");
#endif
}
```

And define the copt like --copt="-DPRO", in that way, the program can have a _pro_ and a _free_ variant. You can also have different files and select them depending of the situation, into the BUILD file you can use **config_setting** and **select**. [Here](https://bazel.build/docs/configurable-attributes#select-and-dependencies) you will find the offical documentation. One example:

> bazel build //:package --copt="-DVERSION=1.0.0" --config=release --define variant=pro --define type=release

## How to handle external bazel rules

Sometimes you can develop a very usefull tool and you want to use it across a lot of project, to do that you can use external rules repositories. This example implements the follow external rules:

- [imgen](https://github.com/RobertoRojas/build-tests-tools/blob/main/imgen/defs.bzl)
- [manifest](https://github.com/RobertoRojas/build-tests-tools/blob/main/manifest/defs.bzl)
    - [External dependency](https://github.com/RobertoRojas/build-tests-tools-binary)

Please take a look into the WORKSPACE files of these repositories, I will only give you one tip; The decompress process of the *http_archive*  will send all the content like it is inside of the tar file, that means that to call the folders you will need the full path, example:

**WORKSPACE**
```Python
http_archive(
    name = "my_external_rules",
    sha256 = "bbb42be1af03668c8bf335eb7f00ae91a0e37c2beaf3d15122c63203e0cc0754",
    url = "https://github.com/RobertoRojas/build-tests-tools/archive/refs/tags/v1.0.0.tar.gz",
)
```

To load into the BUILD.bazel you will need to use the follow command:

**BUILD.baze**
```Python
load("@my_external_rules//build-tests-tools-1.0.0/imgen:defs.bzl", "imgen")
```

In order to reduce the length of the line, you can use the **strip_prefix** property in **http_archive**.

## Actions

The path of the action definition is [this](.github/workflows/4.yaml).