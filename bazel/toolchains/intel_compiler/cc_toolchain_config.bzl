load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "artifact_name_pattern", "tool_path")
load("//bazel/toolchains/intel_compiler:cc_action_config.bzl", "features")

def _impl(ctx):
    tool_paths = [
        # NEW
        tool_path(
            name = "gcc",
            path = "bin/icpx.bat",
        ),
        tool_path(
            name = "as",
            path = "bin/as.bat",
        ),
        tool_path(
            name = "ar",
            path = "bin/ar.bat",
        ),
        tool_path(
            name = "strip",
            path = "bin/strip.bat",
        ),
        tool_path(
            name = "cpp",
            path = "bin/cpp.bat",
        ),
        tool_path(
            name = "ld",
            path = "bin/ld.bat",
        ),
        tool_path(
            name = "nm",
            path = "bin/nm.bat",
        ),
        tool_path(
            name = "objdump",
            path = "bin/objdump.bat",
        ),
    ]

    artifact_name_patterns = [
        artifact_name_pattern(
            category_name = "executable",
            prefix = "",
            extension = ".exe",
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "intel_compiler-toolchain",
        cxx_builtin_include_directories = [
            #"%sysroot%/",
            #"%sysroot%/include",
            #"%sysroot%/lib",
            #"%sysroot%/include/c++/13.1.0",
            #"%sysroot%/include/c++/13.1.0/backward",
            #"%sysroot%/lib/gcc/x86_64-w64-intel_compiler32/13.1.0",
            #"%sysroot%/lib/gcc/x86_64-w64-intel_compiler32/13.1.0/include",
            #"%sysroot%/lib/gcc/x86_64-w64-intel_compiler32/13.1.0/tr1",
            #"%sysroot%/lib/gcc/x86_64-w64-intel_compiler32/13.1.0/bits",
            "%package(@intel_compiler//...)%",
        ],
        #builtin_sysroot = "external/intel_compiler",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "k8",
        target_libc = "unknown",
        compiler = "gcc",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        features = features,
        tool_paths = tool_paths,
        artifact_name_patterns = artifact_name_patterns,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
