def intel_compiler():
    native.new_local_repository(
        name = "intel_compiler",
        path = "C:/Program Files (x86)/Intel/oneAPI",
        build_file = "bazel/toolchains/intel_compiler/BUILD.intel_compiler",
    )
