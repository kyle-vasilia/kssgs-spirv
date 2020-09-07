module kssgs.shaderc.binddynamic;

import bindbc.loader;
import kssgs.shaderc.types;

extern(C) @nogc nothrow {
    struct shaderc_compiler_t {}
    struct shaderc_compile_options_t {}

    struct shaderc_compilation_result {}
    alias shaderc_compilation_result_t = shaderc_compilation_result*;

    struct shaderc_include_result {
        const(char)* source_name;
        size_t source_name_length;
        const(char)* content;
        size_t content_length;
        void* user_data;
    }
    alias shaderc_include_resolve_fn = shaderc_include_result* function(
        void* user_data, const char* requested_source, int type,
        const char* requesting_source, size_t include_depth
    );
    alias shaderc_include_result_release_fn = void function(
        void* user_data, shaderc_include_result* include_result
    );
}

extern(C) @nogc nothrow {
	alias pshaderc_compiler_initialize = shaderc_compiler_t function();
	alias pshaderc_compiler_release = void function(shaderc_compiler_t);
	alias pshaderc_compile_options_initialize = shaderc_compile_options_t    function();
	alias pshaderc_compile_options_clone = shaderc_compile_options_t function(    const shaderc_compile_options_t options);
	alias pshaderc_compile_options_release = void function(    shaderc_compile_options_t options);
	alias pshaderc_compile_options_add_macro_definition = void function(    shaderc_compile_options_t options, const char* name, size_t name_length,    const char* value, size_t value_length);
	alias pshaderc_compile_options_set_source_language = void function(    shaderc_compile_options_t options, shaderc_source_language lang);
	alias pshaderc_compile_options_set_generate_debug_info = void function(    shaderc_compile_options_t options);
	alias pshaderc_compile_options_set_optimization_level = void function(    shaderc_compile_options_t options, shaderc_optimization_level level);
	alias pshaderc_compile_options_set_forced_version_profile = void function(    shaderc_compile_options_t options, int version_, shaderc_profile profile);
	alias pshaderc_compile_options_set_include_callbacks = void function(    shaderc_compile_options_t options, shaderc_include_resolve_fn resolver,    shaderc_include_result_release_fn result_releaser, void* user_data);
	alias pshaderc_compile_options_set_suppress_warnings = void function(    shaderc_compile_options_t options);
	alias pshaderc_compile_options_set_target_env = void function(    shaderc_compile_options_t options,    shaderc_target_env target,    uint version_);
	alias pshaderc_compile_options_set_target_spirv = void function(    shaderc_compile_options_t options, shaderc_spirv_version version_);
	alias pshaderc_compile_options_set_warnings_as_errors = void function(    shaderc_compile_options_t options);
	alias pshaderc_compile_options_set_limit = void function(    shaderc_compile_options_t options, shaderc_limit limit, int value);
	alias pshaderc_compile_options_set_auto_bind_uniforms = void function(    shaderc_compile_options_t options, bool auto_bind);
	alias pshaderc_compile_options_set_hlsl_io_mapping = void function(    shaderc_compile_options_t options, bool hlsl_iomap);
	alias pshaderc_compile_options_set_hlsl_offsets = void function(    shaderc_compile_options_t options, bool hlsl_offsets);
	alias pshaderc_compile_options_set_binding_base = void function(    shaderc_compile_options_t options,    shaderc_uniform_kind kind,    uint base);
	alias pshaderc_compile_options_set_binding_base_for_stage = void function(    shaderc_compile_options_t options, shaderc_shader_kind shader_kind,    shaderc_uniform_kind kind, uint base);
	alias pshaderc_compile_options_set_auto_map_locations = void function(    shaderc_compile_options_t options, bool auto_map);
	alias pshaderc_compile_options_set_hlsl_register_set_and_binding_for_stage = void function(    shaderc_compile_options_t options, shaderc_shader_kind shader_kind,    const char* reg, const char* set, const char* binding);
	alias pshaderc_compile_options_set_hlsl_register_set_and_binding = void function(    shaderc_compile_options_t options, const char* reg, const char* set,    const char* binding);
	alias pshaderc_compile_options_set_hlsl_functionality1 = void function(    shaderc_compile_options_t options, bool enable);
	alias pshaderc_compile_options_set_invert_y = void function(    shaderc_compile_options_t options, bool enable);
	alias pshaderc_compile_options_set_nan_clamp = void function(    shaderc_compile_options_t options, bool enable);
	alias pshaderc_compile_into_spv = shaderc_compilation_result_t function(    const shaderc_compiler_t compiler, const char* source_text,    size_t source_text_size, shaderc_shader_kind shader_kind,    const char* input_file_name, const char* entry_point_name,    const shaderc_compile_options_t additional_options);
	alias pshaderc_compile_into_spv_assembly = shaderc_compilation_result_t function(    const shaderc_compiler_t compiler, const char* source_text,    size_t source_text_size, shaderc_shader_kind shader_kind,    const char* input_file_name, const char* entry_point_name,    const shaderc_compile_options_t additional_options);
	alias pshaderc_compile_into_preprocessed_text = shaderc_compilation_result_t function(    const shaderc_compiler_t compiler, const char* source_text,    size_t source_text_size, shaderc_shader_kind shader_kind,    const char* input_file_name, const char* entry_point_name,    const shaderc_compile_options_t additional_options);
	alias pshaderc_assemble_into_spv = shaderc_compilation_result_t function(    const shaderc_compiler_t compiler, const char* source_assembly,    size_t source_assembly_size,    const shaderc_compile_options_t additional_options);
	alias pshaderc_result_release = void function(shaderc_compilation_result_t result);
	alias pshaderc_result_get_length = size_t function(const shaderc_compilation_result_t result);
	alias pshaderc_result_get_num_warnings = size_t function(    const shaderc_compilation_result_t result);
	alias pshaderc_result_get_num_errors = size_t function(const shaderc_compilation_result_t result);
	alias pshaderc_result_get_compilation_status = shaderc_compilation_status function(    const shaderc_compilation_result_t);
	alias pshaderc_result_get_bytes = const char* function(const shaderc_compilation_result_t result);
	alias pshaderc_result_get_error_message = const char* function(    const shaderc_compilation_result_t result);
	alias pshaderc_get_spv_version = void function(uint* version_, uint* revision);
	alias pshaderc_parse_version_profile = bool function(const char* str, int* version_,                                   shaderc_profile* profile);
}
__gshared {
	pshaderc_compiler_initialize shaderc_compiler_initialize;
	pshaderc_compiler_release shaderc_compiler_release;
	pshaderc_compile_options_initialize shaderc_compile_options_initialize;
	pshaderc_compile_options_clone shaderc_compile_options_clone;
	pshaderc_compile_options_release shaderc_compile_options_release;
	pshaderc_compile_options_add_macro_definition shaderc_compile_options_add_macro_definition;
	pshaderc_compile_options_set_source_language shaderc_compile_options_set_source_language;
	pshaderc_compile_options_set_generate_debug_info shaderc_compile_options_set_generate_debug_info;
	pshaderc_compile_options_set_optimization_level shaderc_compile_options_set_optimization_level;
	pshaderc_compile_options_set_forced_version_profile shaderc_compile_options_set_forced_version_profile;
	pshaderc_compile_options_set_include_callbacks shaderc_compile_options_set_include_callbacks;
	pshaderc_compile_options_set_suppress_warnings shaderc_compile_options_set_suppress_warnings;
	pshaderc_compile_options_set_target_env shaderc_compile_options_set_target_env;
	pshaderc_compile_options_set_target_spirv shaderc_compile_options_set_target_spirv;
	pshaderc_compile_options_set_warnings_as_errors shaderc_compile_options_set_warnings_as_errors;
	pshaderc_compile_options_set_limit shaderc_compile_options_set_limit;
	pshaderc_compile_options_set_auto_bind_uniforms shaderc_compile_options_set_auto_bind_uniforms;
	pshaderc_compile_options_set_hlsl_io_mapping shaderc_compile_options_set_hlsl_io_mapping;
	pshaderc_compile_options_set_hlsl_offsets shaderc_compile_options_set_hlsl_offsets;
	pshaderc_compile_options_set_binding_base shaderc_compile_options_set_binding_base;
	pshaderc_compile_options_set_binding_base_for_stage shaderc_compile_options_set_binding_base_for_stage;
	pshaderc_compile_options_set_auto_map_locations shaderc_compile_options_set_auto_map_locations;
	pshaderc_compile_options_set_hlsl_register_set_and_binding_for_stage shaderc_compile_options_set_hlsl_register_set_and_binding_for_stage;
	pshaderc_compile_options_set_hlsl_register_set_and_binding shaderc_compile_options_set_hlsl_register_set_and_binding;
	pshaderc_compile_options_set_hlsl_functionality1 shaderc_compile_options_set_hlsl_functionality1;
	pshaderc_compile_options_set_invert_y shaderc_compile_options_set_invert_y;
	pshaderc_compile_options_set_nan_clamp shaderc_compile_options_set_nan_clamp;
	pshaderc_compile_into_spv shaderc_compile_into_spv;
	pshaderc_compile_into_spv_assembly shaderc_compile_into_spv_assembly;
	pshaderc_compile_into_preprocessed_text shaderc_compile_into_preprocessed_text;
	pshaderc_assemble_into_spv shaderc_assemble_into_spv;
	pshaderc_result_release shaderc_result_release;
	pshaderc_result_get_length shaderc_result_get_length;
	pshaderc_result_get_num_warnings shaderc_result_get_num_warnings;
	pshaderc_result_get_num_errors shaderc_result_get_num_errors;
	pshaderc_result_get_compilation_status shaderc_result_get_compilation_status;
	pshaderc_result_get_bytes shaderc_result_get_bytes;
	pshaderc_result_get_error_message shaderc_result_get_error_message;
	pshaderc_get_spv_version shaderc_get_spv_version;
	pshaderc_parse_version_profile shaderc_parse_version_profile;
}
private {
	SharedLib lib;
}
bool loadShaderC(const (char)* libName) {
    lib = load(libName);
	lib.bindSymbol(cast(void**)&shaderc_compiler_initialize, "shaderc_compiler_initialize");
	lib.bindSymbol(cast(void**)&shaderc_compiler_release, "shaderc_compiler_release");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_initialize, "shaderc_compile_options_initialize");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_clone, "shaderc_compile_options_clone");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_release, "shaderc_compile_options_release");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_add_macro_definition, "shaderc_compile_options_add_macro_definition");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_source_language, "shaderc_compile_options_set_source_language");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_generate_debug_info, "shaderc_compile_options_set_generate_debug_info");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_optimization_level, "shaderc_compile_options_set_optimization_level");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_forced_version_profile, "shaderc_compile_options_set_forced_version_profile");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_include_callbacks, "shaderc_compile_options_set_include_callbacks");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_suppress_warnings, "shaderc_compile_options_set_suppress_warnings");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_target_env, "shaderc_compile_options_set_target_env");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_target_spirv, "shaderc_compile_options_set_target_spirv");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_warnings_as_errors, "shaderc_compile_options_set_warnings_as_errors");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_limit, "shaderc_compile_options_set_limit");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_auto_bind_uniforms, "shaderc_compile_options_set_auto_bind_uniforms");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_hlsl_io_mapping, "shaderc_compile_options_set_hlsl_io_mapping");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_hlsl_offsets, "shaderc_compile_options_set_hlsl_offsets");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_binding_base, "shaderc_compile_options_set_binding_base");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_binding_base_for_stage, "shaderc_compile_options_set_binding_base_for_stage");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_auto_map_locations, "shaderc_compile_options_set_auto_map_locations");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_hlsl_register_set_and_binding_for_stage, "shaderc_compile_options_set_hlsl_register_set_and_binding_for_stage");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_hlsl_register_set_and_binding, "shaderc_compile_options_set_hlsl_register_set_and_binding");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_hlsl_functionality1, "shaderc_compile_options_set_hlsl_functionality1");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_invert_y, "shaderc_compile_options_set_invert_y");
	lib.bindSymbol(cast(void**)&shaderc_compile_options_set_nan_clamp, "shaderc_compile_options_set_nan_clamp");
	lib.bindSymbol(cast(void**)&shaderc_compile_into_spv, "shaderc_compile_into_spv");
	lib.bindSymbol(cast(void**)&shaderc_compile_into_spv_assembly, "shaderc_compile_into_spv_assembly");
	lib.bindSymbol(cast(void**)&shaderc_compile_into_preprocessed_text, "shaderc_compile_into_preprocessed_text");
	lib.bindSymbol(cast(void**)&shaderc_assemble_into_spv, "shaderc_assemble_into_spv");
	lib.bindSymbol(cast(void**)&shaderc_result_release, "shaderc_result_release");
	lib.bindSymbol(cast(void**)&shaderc_result_get_length, "shaderc_result_get_length");
	lib.bindSymbol(cast(void**)&shaderc_result_get_num_warnings, "shaderc_result_get_num_warnings");
	lib.bindSymbol(cast(void**)&shaderc_result_get_num_errors, "shaderc_result_get_num_errors");
	lib.bindSymbol(cast(void**)&shaderc_result_get_compilation_status, "shaderc_result_get_compilation_status");
	lib.bindSymbol(cast(void**)&shaderc_result_get_bytes, "shaderc_result_get_bytes");
	lib.bindSymbol(cast(void**)&shaderc_result_get_error_message, "shaderc_result_get_error_message");
	lib.bindSymbol(cast(void**)&shaderc_get_spv_version, "shaderc_get_spv_version");
	lib.bindSymbol(cast(void**)&shaderc_parse_version_profile, "shaderc_parse_version_profile");
    import std.stdio;
    writeln(errorCount());
    return false;
}