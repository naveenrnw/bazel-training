package(default_visibility = ["//visibility:public"])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

exports_files(glob(["bin/*.bat"]))

cc_toolchain(
    name = "cc_compiler_mingw_toolchain",
    all_files = "@mingw//:all",
    ar_files = "@mingw//:ar_file",
    as_files = "@mingw//:as_file",
    compiler_files = "@mingw//:gcc",
    dwp_files = "@mingw//:empty",
    linker_files = "@mingw//:empty",
    objcopy_files = "@mingw//:objcopy",
    strip_files = "@mingw//:strip",
    supports_param_files = 1,
    toolchain_config = "mingw_toolchain_config",
    toolchain_identifier = "mingw-toolchain",
)

cc_toolchain_config(
    name = "mingw_toolchain_config",
    #compiler = "@mingw//:compiler",
    #tools = ["@mingw//:compiler"]
)

#cc_toolchain_suite(
#    name = "mingw_suite",
#    toolchains = {
#        "x84_64": ":cc_compiler_mingw_toolchain",
#    },
#)

toolchain(
    name = "mingw_toolchain",
    exec_compatible_with = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":cc_compiler_mingw_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
