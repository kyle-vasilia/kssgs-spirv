module kssgs.glslang.binddynamic;

import bindbc.loader;
import kssgs.glslang.types;

extern(C) @nogc nothrow {
    alias pglsl_include_local_func = glsl_include_result_t* function(void* ctx, const char* header_name, const char* includer_name,
                                                            size_t include_depth);
    alias pglsl_include_system_func = glsl_include_result_t* function(void* ctx, const char* header_name,
                                                            const char* includer_name, size_t include_depth);
    alias pglsl_free_include_result_func = int function(void* ctx, glsl_include_result_t* result);

    alias pglslang_initialize_process = int function();
    alias pglslang_finalize_process = void function();
} 
__gshared {
    pglslang_initialize_process glslang_initialize_process;
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
    writeln(glslang_initialize_process());
    return true;
}

}