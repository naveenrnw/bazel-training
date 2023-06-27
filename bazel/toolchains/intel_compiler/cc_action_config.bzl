load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
)

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

all_compile_actions = [
    ACTION_NAMES.assemble,
    ACTION_NAMES.c_compile,
    ACTION_NAMES.clif_match,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.cpp_module_codegen,
    ACTION_NAMES.cpp_module_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.lto_backend,
    ACTION_NAMES.preprocess_assemble,
]

default_compiler_flags = feature(
    name = "default_compiler_flags",
    enabled = True,
    flag_sets = [
        flag_set(
            actions = all_compile_actions,
            flag_groups = [
                flag_group(
                    flags = [
                       "-fsycl",
                       "--sysroot=external/intel_compiler",
                       "-Iexternal/intel_compiler/include"
                       #"/EHsc",
                    ],
                ),
            ],
        ),
    ],
)

default_linker_flags = feature(
    name = "default_linker_flags",
    enabled = True,
    flag_sets = [
        flag_set(
            actions = all_link_actions,
            flag_groups = ([
                flag_group(
                    flags = [
                        "--sysroot=external/intel_compiler",
                        "-fsycl-device-code-split=per_kernel",
                    ],
                ),
            ]),
        ),
    ],
)

features = [
    default_compiler_flags,
    default_linker_flags,
]