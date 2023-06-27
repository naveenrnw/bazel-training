package(default_visibility = ["//visibility:public"])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

exports_files(glob(["bin/*.bat"]))

cc_toolchain(
    name = "cc_compiler_intel_toolchain",
    all_files = "@intel_compiler//:all",
    ar_files = "@intel_compiler//:empty",
    as_files = "@intel_compiler//:empty",
    compiler_files = "@intel_compiler//:empty",
    dwp_files = "@intel_compiler//:empty",
    linker_files = "@intel_compiler//:empty",
    objcopy_files = "@intel_compiler//:empty",
    strip_files = "@intel_compiler//:empty",
    supports_param_files = 1,
    toolchain_config = "intel_compiler_toolchain_config",
    toolchain_identifier = "intel-toolchain",
)

cc_toolchain_config(
    name = "intel_compiler_toolchain_config",
    #compiler = "@intel_compiler//:compiler",
    #tools = ["@intel_compiler//:compiler"]
)

#cc_toolchain_suite(
#    name = "intel_compiler_suite",
#    toolchains = {
#        "x84_64": ":cc_compiler_intel_compiler_toolchain",
#    },
#)

toolchain(
    name = "intel_toolchain",
    exec_compatible_with = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":cc_compiler_intel_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
