# Stage 1

This showcases how to build a single file to create a runnable application.

This BUILD file shows that we want to build a C++ binary using the ```cc_binary``` rule provided by Bazel using different compilers based on config settings.
Available config settings are:
```
--config mingw_cpp_config : Builds with mingw toolchain
--config intel_cpp_config : Build with intel toolchain
```

In the ```cc_binary``` rule, name of the binary is specified in ```name``` attribute (in this example, it's ```hello-world```), required source files to be built are provided in ```srcs``` attribute.

To build this example, use
```
bazel build --config mingw_cpp_config //main:hello-world 
```


In the run log above you can see where the executable was built so you can locate it and use it.

You can also get the output path with the bazel cquery command. For
example, the command below would print the path to the output file. This
is a useful technique for use in scripts, where you do not want to parse the
`bazel build` output.

```
bazel cquery --output=starlark \
  --starlark:expr="' '.join([f.path for f in target.files.to_list()])" \
  //main:hello-world
```
