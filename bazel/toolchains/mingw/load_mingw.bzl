def mingw():
    native.new_local_repository(
        name = "mingw",
        path = "C:/msys64/mingw64",
        build_file = "bazel-training/bazel/toolchains/mingw/BUILD.mingw",
    )
