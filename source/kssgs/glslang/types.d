module kssgs.glslang.types;

enum glslangSupport {
    noLibrary,
    badLibrary
}

enum glslang_stage_t {
    GLSLANG_STAGE_VERTEX,
    GLSLANG_STAGE_TESSCONTROL,
    GLSLANG_STAGE_TESSEVALUATION,
    GLSLANG_STAGE_GEOMETRY,
    GLSLANG_STAGE_FRAGMENT,
    GLSLANG_STAGE_COMPUTE,
    GLSLANG_STAGE_RAYGEN_NV,
    GLSLANG_STAGE_INTERSECT_NV,
    GLSLANG_STAGE_ANYHIT_NV,
    GLSLANG_STAGE_CLOSESTHIT_NV,
    GLSLANG_STAGE_MISS_NV,
    GLSLANG_STAGE_CALLABLE_NV,
    GLSLANG_STAGE_TASK_NV,
    GLSLANG_STAGE_MESH_NV,
    GLSLANG_STAGE_COUNT
}

enum glslang_stage_mask_t {
    GLSLANG_STAGE_VERTEX_MASK =         (1 << glslang_stage_t.GLSLANG_STAGE_VERTEX),
    GLSLANG_STAGE_TESSCONTROL_MASK =    (1 << glslang_stage_t.GLSLANG_STAGE_TESSCONTROL),
    GLSLANG_STAGE_TESSEVALUATION_MASK = (1 << glslang_stage_t.GLSLANG_STAGE_TESSEVALUATION),
    GLSLANG_STAGE_GEOMETRY_MASK =       (1 << glslang_stage_t.GLSLANG_STAGE_GEOMETRY),
    GLSLANG_STAGE_FRAGMENT_MASK =       (1 << glslang_stage_t.GLSLANG_STAGE_FRAGMENT),
    GLSLANG_STAGE_COMPUTE_MASK =        (1 << glslang_stage_t.GLSLANG_STAGE_COMPUTE),
    GLSLANG_STAGE_RAYGEN_NV_MASK =      (1 << glslang_stage_t.GLSLANG_STAGE_RAYGEN_NV),
    GLSLANG_STAGE_INTERSECT_NV_MASK =   (1 << glslang_stage_t.GLSLANG_STAGE_INTERSECT_NV),
    GLSLANG_STAGE_ANYHIT_NV_MASK =      (1 << glslang_stage_t.GLSLANG_STAGE_ANYHIT_NV),
    GLSLANG_STAGE_CLOSESTHIT_NV_MASK =  (1 << glslang_stage_t.GLSLANG_STAGE_CLOSESTHIT_NV),
    GLSLANG_STAGE_MISS_NV_MASK =        (1 << glslang_stage_t.GLSLANG_STAGE_MISS_NV),
    GLSLANG_STAGE_CALLABLE_NV_MASK =    (1 << glslang_stage_t.GLSLANG_STAGE_CALLABLE_NV),
    GLSLANG_STAGE_TASK_NV_MASK =        (1 << glslang_stage_t.GLSLANG_STAGE_TASK_NV),
    GLSLANG_STAGE_MESH_NV_MASK =        (1 << glslang_stage_t.GLSLANG_STAGE_MESH_NV),
    GLSLANG_STAGE_MASK_COUNT 
}

enum glslang_source_t {
    GLSLANG_SOURCE_NONE,
    GLSLANG_SOURCE_GLSL,
    GLSLANG_SOURCE_HLSL,
    GLSLANG_SOURCE_COUNT
}

enum glslang_client_t {
    GLSLANG_CLIENT_NONE,
    GLSLANG_CLIENT_VULKAN,
    GLSLANG_CLIENT_OPENGL
}

enum glslang_target_language_t {
    GLSLANG_TARGET_NONE,
    GLSLANG_TARGET_SPV,
    GLSLANG_TARGET_COUNT
}

enum glslang_target_client_version_t {
    GLSLANG_TARGET_VULKAN_1_0 = (1 << 22),
    GLSLANG_TARGET_VULKAN_1_1 = (1 << 22) | (1 << 12),
    GLSLANG_TARGET_OPENGL_450 = 450,
    GLSLANG_TARGET_CLIENT_VERSION_COUNT
}

enum glslang_target_language_version_t {
    GLSLANG_TARGET_SPV_1_0 = (1 << 16),
    GLSLANG_TARGET_SPV_1_1 = (1 << 16) | (1 << 8),
    GLSLANG_TARGET_SPV_1_2 = (1 << 16) | (2 << 8),
    GLSLANG_TARGET_SPV_1_3 = (1 << 16) | (3 << 8),
    GLSLANG_TARGET_SPV_1_4 = (1 << 16) | (4 << 8),
    GLSLANG_TARGET_SPV_1_5 = (1 << 16) | (5 << 8),
    GLSLANG_TARGET_LANGUAGE_VERSION_COUNT
}

enum glslang_executable_t { 
    GLSLANG_EX_VERTEX_FRAGMENT, GLSLANG_EX_FRAGMENT 
}

enum glslang_optimization_level_t {
    GLSLANG_OPT_NO_GENERATION,
    GLSLANG_OPT_NONE,
    GLSLANG_OPT_SIMPLE,
    GLSLANG_OPT_FULL,
    GLSLANG_OPT_LEVEL_COUNT
}

enum glslang_texture_sampler_transform_mode_t {
    GLSLANG_TEX_SAMP_TRANS_KEEP,
    GLSLANG_TEX_SAMP_TRANS_UPGRADE_TEXTURE_REMOVE_SAMPLER,
    GLSLANG_TEX_SAMP_TRANS_COUNT
}

enum glslang_messages_t {
    GLSLANG_MSG_DEFAULT_BIT = 0,
    GLSLANG_MSG_RELAXED_ERRORS_BIT = (1 << 0),
    GLSLANG_MSG_SUPPRESS_WARNINGS_BIT = (1 << 1),
    GLSLANG_MSG_AST_BIT = (1 << 2),
    GLSLANG_MSG_SPV_RULES_BIT = (1 << 3),
    GLSLANG_MSG_VULKAN_RULES_BIT = (1 << 4),
    GLSLANG_MSG_ONLY_PREPROCESSOR_BIT = (1 << 5),
    GLSLANG_MSG_READ_HLSL_BIT = (1 << 6),
    GLSLANG_MSG_CASCADING_ERRORS_BIT = (1 << 7),
    GLSLANG_MSG_KEEP_UNCALLED_BIT = (1 << 8),
    GLSLANG_MSG_HLSL_OFFSETS_BIT = (1 << 9),
    GLSLANG_MSG_DEBUG_INFO_BIT = (1 << 10),
    GLSLANG_MSG_HLSL_ENABLE_16BIT_TYPES_BIT = (1 << 11),
    GLSLANG_MSG_HLSL_LEGALIZATION_BIT = (1 << 12),
    GLSLANG_MSG_HLSL_DX9_COMPATIBLE_BIT = (1 << 13),
    GLSLANG_MSG_BUILTIN_SYMBOL_TABLE_BIT = (1 << 14),
    GLSLANG_MSG_COUNT
}

enum glslang_reflection_options_t {
    GLSLANG_REFLECTION_DEFAULT_BIT = 0,
    GLSLANG_REFLECTION_STRICT_ARRAY_SUFFIX_BIT = (1 << 0),
    GLSLANG_REFLECTION_BASIC_ARRAY_SUFFIX_BIT = (1 << 1),
    GLSLANG_REFLECTION_INTERMEDIATE_IOO_BIT = (1 << 2),
    GLSLANG_REFLECTION_SEPARATE_BUFFERS_BIT = (1 << 3),
    GLSLANG_REFLECTION_ALL_BLOCK_VARIABLES_BIT = (1 << 4),
    GLSLANG_REFLECTION_UNWRAP_IO_BLOCKS_BIT = (1 << 5),
    GLSLANG_REFLECTION_ALL_IO_VARIABLES_BIT = (1 << 6),
    GLSLANG_REFLECTION_SHARED_STD140_SSBO_BIT = (1 << 7),
    GLSLANG_REFLECTION_SHARED_STD140_UBO_BIT = (1 << 8),
    GLSLANG_REFLECTION_COUNT
}

enum glslang_profile_t {
    GLSLANG_BAD_PROFILE = 0,
    GLSLANG_NO_PROFILE = (1 << 0),
    GLSLANG_CORE_PROFILE = (1 << 1),
    GLSLANG_COMPATIBILITY_PROFILE = (1 << 2),
    GLSLANG_ES_PROFILE = (1 << 3),
    GLSLANG_PROFILE_COUNT
}

struct glslang_limits_t {
    bool non_inductive_for_loops;
    bool while_loops;
    bool do_while_loops;
    bool general_uniform_indexing;
    bool general_attribute_matrix_vector_indexing;
    bool general_varying_indexing;
    bool general_sampler_indexing;
    bool general_variable_indexing;
    bool general_constant_matrix_vector_indexing;
} 
struct glslang_resource_t {
    int max_lights;
    int max_clip_planes;
    int max_texture_units;
    int max_texture_coords;
    int max_vertex_attribs;
    int max_vertex_uniform_components;
    int max_varying_floats;
    int max_vertex_texture_image_units;
    int max_combined_texture_image_units;
    int max_texture_image_units;
    int max_fragment_uniform_components;
    int max_draw_buffers;
    int max_vertex_uniform_vectors;
    int max_varying_vectors;
    int max_fragment_uniform_vectors;
    int max_vertex_output_vectors;
    int max_fragment_input_vectors;
    int min_program_texel_offset;
    int max_program_texel_offset;
    int max_clip_distances;
    int max_compute_work_group_count_x;
    int max_compute_work_group_count_y;
    int max_compute_work_group_count_z;
    int max_compute_work_group_size_x;
    int max_compute_work_group_size_y;
    int max_compute_work_group_size_z;
    int max_compute_uniform_components;
    int max_compute_texture_image_units;
    int max_compute_image_uniforms;
    int max_compute_atomic_counters;
    int max_compute_atomic_counter_buffers;
    int max_varying_components;
    int max_vertex_output_components;
    int max_geometry_input_components;
    int max_geometry_output_components;
    int max_fragment_input_components;
    int max_image_units;
    int max_combined_image_units_and_fragment_outputs;
    int max_combined_shader_output_resources;
    int max_image_samples;
    int max_vertex_image_uniforms;
    int max_tess_control_image_uniforms;
    int max_tess_evaluation_image_uniforms;
    int max_geometry_image_uniforms;
    int max_fragment_image_uniforms;
    int max_combined_image_uniforms;
    int max_geometry_texture_image_units;
    int max_geometry_output_vertices;
    int max_geometry_total_output_components;
    int max_geometry_uniform_components;
    int max_geometry_varying_components;
    int max_tess_control_input_components;
    int max_tess_control_output_components;
    int max_tess_control_texture_image_units;
    int max_tess_control_uniform_components;
    int max_tess_control_total_output_components;
    int max_tess_evaluation_input_components;
    int max_tess_evaluation_output_components;
    int max_tess_evaluation_texture_image_units;
    int max_tess_evaluation_uniform_components;
    int max_tess_patch_components;
    int max_patch_vertices;
    int max_tess_gen_level;
    int max_viewports;
    int max_vertex_atomic_counters;
    int max_tess_control_atomic_counters;
    int max_tess_evaluation_atomic_counters;
    int max_geometry_atomic_counters;
    int max_fragment_atomic_counters;
    int max_combined_atomic_counters;
    int max_atomic_counter_bindings;
    int max_vertex_atomic_counter_buffers;
    int max_tess_control_atomic_counter_buffers;
    int max_tess_evaluation_atomic_counter_buffers;
    int max_geometry_atomic_counter_buffers;
    int max_fragment_atomic_counter_buffers;
    int max_combined_atomic_counter_buffers;
    int max_atomic_counter_buffer_size;
    int max_transform_feedback_buffers;
    int max_transform_feedback_interleaved_components;
    int max_cull_distances;
    int max_combined_clip_and_cull_distances;
    int max_samples;
    int max_mesh_output_vertices_nv;
    int max_mesh_output_primitives_nv;
    int max_mesh_work_group_size_x_nv;
    int max_mesh_work_group_size_y_nv;
    int max_mesh_work_group_size_z_nv;
    int max_task_work_group_size_x_nv;
    int max_task_work_group_size_y_nv;
    int max_task_work_group_size_z_nv;
    int max_mesh_view_count_nv;
    int maxDualSourceDrawBuffersEXT;

    glslang_limits_t limits;
}

struct glslang_input_t {
    glslang_source_t language;
    glslang_stage_t stage;
    glslang_client_t client;
    glslang_target_client_version_t client_version;
    glslang_target_language_t target_language;
    glslang_target_language_version_t target_language_version;
    const char* code;
    int default_version;
    glslang_profile_t default_profile;
    int force_default_version_and_profile;
    int forward_compatible;
    glslang_messages_t messages;
    const glslang_resource_t* resource;    
}

struct glsl_include_result_t {
    const char* header_name;
    const char* header_data;
    size_t header_length;
}