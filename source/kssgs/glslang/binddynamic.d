module kssgs.glslang.binddynamic;

import bindbc.loader;
import kssgs.glslang.types;

extern(C) @nogc nothrow {
    alias pglsl_include_local_func = glsl_include_result_t* function(void* ctx, const char* header_name, const char* includer_name,
                                                            size_t include_depth);
    alias pglsl_include_system_func = glsl_include_result_t* function(void* ctx, const char* header_name,
                                                            const char* includer_name, size_t include_depth);
    alias pglsl_free_include_result_func = int function(void* ctx, glsl_include_result_t* result);
    struct glslang_shader_t {};
    struct glslang_program_t {};

}

extern(C) @nogc nothrow {
	alias pglslang_initialize_process = int function();
	alias pglslang_finalize_process = void function();
	alias pglslang_shader_create = glslang_shader_t* function(const glslang_input_t* input);
	alias pglslang_shader_delete = void function(glslang_shader_t* shader);
	alias pglslang_shader_preprocess = int function(glslang_shader_t* shader, const glslang_input_t* input);
	alias pglslang_shader_parse = int function(glslang_shader_t* shader, const glslang_input_t* input);
	alias pglslang_shader_get_preprocessed_code = const char* function(glslang_shader_t* shader);
	alias pglslang_shader_get_info_log = const char* function(glslang_shader_t* shader);
	alias pglslang_shader_get_info_debug_log = const char* function(glslang_shader_t* shader);
	alias pglslang_program_create = glslang_program_t* function();
	alias pglslang_program_delete = void function(glslang_program_t* program);
	alias pglslang_program_add_shader = void function(glslang_program_t* program, glslang_shader_t* shader);
	alias pglslang_program_link = int function(glslang_program_t* program, int messages); // glslang_messages);

	alias pglslang_program_SPIRV_generate = void function(glslang_program_t* program, glslang_stage_t stage);
	alias pglslang_program_SPIRV_get_size = size_t function(glslang_program_t* program);
	alias pglslang_program_SPIRV_get = void function(glslang_program_t* program, uint*);
	alias pglslang_program_SPIRV_get_ptr = uint* function(glslang_program_t* program);
	alias pglslang_program_SPIRV_get_messages = const char* function(glslang_program_t* program);

	alias pglslang_program_get_info_log = const char* function(glslang_program_t* program);
	alias pglslang_program_get_info_debug_log = const char* function(glslang_program_t* program);
}
__gshared {
	pglslang_initialize_process glslang_initialize_process;
	pglslang_finalize_process glslang_finalize_process;
	pglslang_shader_create glslang_shader_create;
	pglslang_shader_delete glslang_shader_delete;
	pglslang_shader_preprocess glslang_shader_preprocess;
	pglslang_shader_parse glslang_shader_parse;
	pglslang_shader_get_preprocessed_code glslang_shader_get_preprocessed_code;
	pglslang_shader_get_info_log glslang_shader_get_info_log;
	pglslang_shader_get_info_debug_log glslang_shader_get_info_debug_log;
	pglslang_program_create glslang_program_create;
	pglslang_program_delete glslang_program_delete;
	pglslang_program_add_shader glslang_program_add_shader;
	pglslang_program_link glslang_program_link;
	pglslang_program_SPIRV_generate glslang_program_SPIRV_generate;
	pglslang_program_SPIRV_get_size glslang_program_SPIRV_get_size;
	pglslang_program_SPIRV_get glslang_program_SPIRV_get;
	pglslang_program_SPIRV_get_ptr glslang_program_SPIRV_get_ptr;
	pglslang_program_SPIRV_get_messages glslang_program_SPIRV_get_messages;
	pglslang_program_get_info_log glslang_program_get_info_log;
	pglslang_program_get_info_debug_log glslang_program_get_info_debug_log;
private {
	SharedLib lib;
}


bool loadGlslang(const (char)* libName) {
    
    lib = load(libName);
    import std.stdio;
    if(lib == invalidHandle) {
        writeln("test");
    }
	lib.bindSymbol(cast(void**)&glslang_initialize_process, "glslang_initialize_process");
	lib.bindSymbol(cast(void**)&glslang_finalize_process, "glslang_finalize_process");
	lib.bindSymbol(cast(void**)&glslang_shader_create, "glslang_shader_create");
	lib.bindSymbol(cast(void**)&glslang_shader_delete, "glslang_shader_delete");
	lib.bindSymbol(cast(void**)&glslang_shader_preprocess, "glslang_shader_preprocess");
	lib.bindSymbol(cast(void**)&glslang_shader_parse, "glslang_shader_parse");
	lib.bindSymbol(cast(void**)&glslang_shader_get_preprocessed_code, "glslang_shader_get_preprocessed_code");
	lib.bindSymbol(cast(void**)&glslang_shader_get_info_log, "glslang_shader_get_info_log");
	lib.bindSymbol(cast(void**)&glslang_shader_get_info_debug_log, "glslang_shader_get_info_debug_log");
	lib.bindSymbol(cast(void**)&glslang_program_create, "glslang_program_create");
	lib.bindSymbol(cast(void**)&glslang_program_delete, "glslang_program_delete");
	lib.bindSymbol(cast(void**)&glslang_program_add_shader, "glslang_program_add_shader");
	lib.bindSymbol(cast(void**)&glslang_program_link, "glslang_program_link");
    
    writeln(errorCount());
	lib.bindSymbol(cast(void**)&glslang_program_SPIRV_generate, "glslang_program_SPIRV_generate");
	lib.bindSymbol(cast(void**)&glslang_program_SPIRV_get_size, "glslang_program_SPIRV_get_size");
	lib.bindSymbol(cast(void**)&glslang_program_SPIRV_get, "glslang_program_SPIRV_get");
	lib.bindSymbol(cast(void**)&glslang_program_SPIRV_get_ptr, "glslang_program_SPIRV_get_ptr");
	lib.bindSymbol(cast(void**)&glslang_program_SPIRV_get_messages, "glslang_program_SPIRV_get_messages");
    writeln(errorCount());

	lib.bindSymbol(cast(void**)&glslang_program_get_info_log, "glslang_program_get_info_log");
	lib.bindSymbol(cast(void**)&glslang_program_get_info_debug_log, "glslang_program_get_info_debug_log");
    
    return true;
}

}