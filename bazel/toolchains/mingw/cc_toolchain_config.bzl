load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path", "artifact_name_pattern")
load("//bazel/toolchains/mingw:cc_action_config.bzl", "features")

def _impl(ctx):
    tool_paths = [ # NEW
        tool_path(
            name = "gcc",
            path = "bin/gcc.bat",
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
        toolchain_identifier = "mingw-toolchain",
        cxx_builtin_include_directories = [
            #"%sysroot%/",
            #"%sysroot%/include",
            #"%sysroot%/lib",
            #"%sysroot%/include/c++/13.1.0",
            #"%sysroot%/include/c++/13.1.0/backward",
            #"%sysroot%/lib/gcc/x86_64-w64-mingw32/13.1.0",
            #"%sysroot%/lib/gcc/x86_64-w64-mingw32/13.1.0/include",
            #"%sysroot%/lib/gcc/x86_64-w64-mingw32/13.1.0/tr1",
            #"%sysroot%/lib/gcc/x86_64-w64-mingw32/13.1.0/bits",
            "%package(@mingw//...)%",
        ],
        #builtin_sysroot = "external/mingw",
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