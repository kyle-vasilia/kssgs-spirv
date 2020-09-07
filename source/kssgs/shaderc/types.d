module kssgs.shaderc.types;

enum shaderc_compilation_status {
  shaderc_compilation_status_success = 0,
  shaderc_compilation_status_invalid_stage = 1,  // error stage deduction
  shaderc_compilation_status_compilation_error = 2,
  shaderc_compilation_status_internal_error = 3,  // unexpected failure
  shaderc_compilation_status_null_result_object = 4,
  shaderc_compilation_status_invalid_assembly = 5,
  shaderc_compilation_status_validation_error = 6,
  shaderc_compilation_status_transformation_error = 7,
  shaderc_compilation_status_configuration_error = 8,
}

enum shaderc_target_env {
    shaderc_target_env_vulkan,
    shaderc_target_env_opengl, 
    shaderc_target_env_opengl_compat,                                                           
    shaderc_target_env_webgpu,         
    shaderc_target_env_default = shaderc_target_env_vulkan
}

enum shaderc_env_version {
    shaderc_env_version_vulkan_1_0 = ((1u << 22)),
    shaderc_env_version_vulkan_1_1 = ((1u << 22) | (1 << 12)),
    shaderc_env_version_vulkan_1_2 = ((1u << 22) | (2 << 12)),
    shaderc_env_version_opengl_4_5 = 450,
    shaderc_env_version_webgpu
}

enum shaderc_spirv_version {
    shaderc_spirv_version_1_0 = 0x010000u,
    shaderc_spirv_version_1_1 = 0x010100u,
    shaderc_spirv_version_1_2 = 0x010200u,
    shaderc_spirv_version_1_3 = 0x010300u,
    shaderc_spirv_version_1_4 = 0x010400u,
    shaderc_spirv_version_1_5 = 0x010500u
}

enum shaderc_source_language {
    shaderc_source_language_glsl,
    shaderc_source_language_hlsl,
}

enum shaderc_shader_kind {
    shaderc_vertex_shader,
    shaderc_fragment_shader,
    shaderc_compute_shader,
    shaderc_geometry_shader,
    shaderc_tess_control_shader,
    shaderc_tess_evaluation_shader,
    shaderc_glsl_vertex_shader = shaderc_vertex_shader,
    shaderc_glsl_fragment_shader = shaderc_fragment_shader,
    shaderc_glsl_compute_shader = shaderc_compute_shader,
    shaderc_glsl_geometry_shader = shaderc_geometry_shader,
    shaderc_glsl_tess_control_shader = shaderc_tess_control_shader,
    shaderc_glsl_tess_evaluation_shader = shaderc_tess_evaluation_shader,
    shaderc_glsl_infer_from_source,
    shaderc_glsl_default_vertex_shader,
    shaderc_glsl_default_fragment_shader,
    shaderc_glsl_default_compute_shader,
    shaderc_glsl_default_geometry_shader,
    shaderc_glsl_default_tess_control_shader,
    shaderc_glsl_default_tess_evaluation_shader,
    shaderc_spirv_assembly,
    shaderc_raygen_shader,
    shaderc_anyhit_shader,
    shaderc_closesthit_shader,
    shaderc_miss_shader,
    shaderc_intersection_shader,
    shaderc_callable_shader,
    shaderc_glsl_raygen_shader = shaderc_raygen_shader,
    shaderc_glsl_anyhit_shader = shaderc_anyhit_shader,
    shaderc_glsl_closesthit_shader = shaderc_closesthit_shader,
    shaderc_glsl_miss_shader = shaderc_miss_shader,
    shaderc_glsl_intersection_shader = shaderc_intersection_shader,
    shaderc_glsl_callable_shader = shaderc_callable_shader,
    shaderc_glsl_default_raygen_shader,
    shaderc_glsl_default_anyhit_shader,
    shaderc_glsl_default_closesthit_shader,
    shaderc_glsl_default_miss_shader,
    shaderc_glsl_default_intersection_shader,
    shaderc_glsl_default_callable_shader,
    shaderc_task_shader,
    shaderc_mesh_shader,
    shaderc_glsl_task_shader = shaderc_task_shader,
    shaderc_glsl_mesh_shader = shaderc_mesh_shader,
    shaderc_glsl_default_task_shader,
    shaderc_glsl_default_mesh_shader
}

enum shaderc_profile {
    shaderc_profile_none,  
    shaderc_profile_core,
    shaderc_profile_compatibility,
    shaderc_profile_es
}

enum shaderc_optimization_level {
    shaderc_optimization_level_zero, 
    shaderc_optimization_level_size,  
    shaderc_optimization_level_performance,
}

enum shaderc_limit {
  shaderc_limit_max_lights,
  shaderc_limit_max_clip_planes,
  shaderc_limit_max_texture_units,
  shaderc_limit_max_texture_coords,
  shaderc_limit_max_vertex_attribs,
  shaderc_limit_max_vertex_uniform_components,
  shaderc_limit_max_varying_floats,
  shaderc_limit_max_vertex_texture_image_units,
  shaderc_limit_max_combined_texture_image_units,
  shaderc_limit_max_texture_image_units,
  shaderc_limit_max_fragment_uniform_components,
  shaderc_limit_max_draw_buffers,
  shaderc_limit_max_vertex_uniform_vectors,
  shaderc_limit_max_varying_vectors,
  shaderc_limit_max_fragment_uniform_vectors,
  shaderc_limit_max_vertex_output_vectors,
  shaderc_limit_max_fragment_input_vectors,
  shaderc_limit_min_program_texel_offset,
  shaderc_limit_max_program_texel_offset,
  shaderc_limit_max_clip_distances,
  shaderc_limit_max_compute_work_group_count_x,
  shaderc_limit_max_compute_work_group_count_y,
  shaderc_limit_max_compute_work_group_count_z,
  shaderc_limit_max_compute_work_group_size_x,
  shaderc_limit_max_compute_work_group_size_y,
  shaderc_limit_max_compute_work_group_size_z,
  shaderc_limit_max_compute_uniform_components,
  shaderc_limit_max_compute_texture_image_units,
  shaderc_limit_max_compute_image_uniforms,
  shaderc_limit_max_compute_atomic_counters,
  shaderc_limit_max_compute_atomic_counter_buffers,
  shaderc_limit_max_varying_components,
  shaderc_limit_max_vertex_output_components,
  shaderc_limit_max_geometry_input_components,
  shaderc_limit_max_geometry_output_components,
  shaderc_limit_max_fragment_input_components,
  shaderc_limit_max_image_units,
  shaderc_limit_max_combined_image_units_and_fragment_outputs,
  shaderc_limit_max_combined_shader_output_resources,
  shaderc_limit_max_image_samples,
  shaderc_limit_max_vertex_image_uniforms,
  shaderc_limit_max_tess_control_image_uniforms,
  shaderc_limit_max_tess_evaluation_image_uniforms,
  shaderc_limit_max_geometry_image_uniforms,
  shaderc_limit_max_fragment_image_uniforms,
  shaderc_limit_max_combined_image_uniforms,
  shaderc_limit_max_geometry_texture_image_units,
  shaderc_limit_max_geometry_output_vertices,
  shaderc_limit_max_geometry_total_output_components,
  shaderc_limit_max_geometry_uniform_components,
  shaderc_limit_max_geometry_varying_components,
  shaderc_limit_max_tess_control_input_components,
  shaderc_limit_max_tess_control_output_components,
  shaderc_limit_max_tess_control_texture_image_units,
  shaderc_limit_max_tess_control_uniform_components,
  shaderc_limit_max_tess_control_total_output_components,
  shaderc_limit_max_tess_evaluation_input_components,
  shaderc_limit_max_tess_evaluation_output_components,
  shaderc_limit_max_tess_evaluation_texture_image_units,
  shaderc_limit_max_tess_evaluation_uniform_components,
  shaderc_limit_max_tess_patch_components,
  shaderc_limit_max_patch_vertices,
  shaderc_limit_max_tess_gen_level,
  shaderc_limit_max_viewports,
  shaderc_limit_max_vertex_atomic_counters,
  shaderc_limit_max_tess_control_atomic_counters,
  shaderc_limit_max_tess_evaluation_atomic_counters,
  shaderc_limit_max_geometry_atomic_counters,
  shaderc_limit_max_fragment_atomic_counters,
  shaderc_limit_max_combined_atomic_counters,
  shaderc_limit_max_atomic_counter_bindings,
  shaderc_limit_max_vertex_atomic_counter_buffers,
  shaderc_limit_max_tess_control_atomic_counter_buffers,
  shaderc_limit_max_tess_evaluation_atomic_counter_buffers,
  shaderc_limit_max_geometry_atomic_counter_buffers,
  shaderc_limit_max_fragment_atomic_counter_buffers,
  shaderc_limit_max_combined_atomic_counter_buffers,
  shaderc_limit_max_atomic_counter_buffer_size,
  shaderc_limit_max_transform_feedback_buffers,
  shaderc_limit_max_transform_feedback_interleaved_components,
  shaderc_limit_max_cull_distances,
  shaderc_limit_max_combined_clip_and_cull_distances,
  shaderc_limit_max_samples,
}

enum shaderc_uniform_kind {
    shaderc_uniform_kind_image,
    shaderc_uniform_kind_sampler,
    shaderc_uniform_kind_texture,
    shaderc_uniform_kind_buffer,
    shaderc_uniform_kind_storage_buffer,
    shaderc_uniform_kind_unordered_access_view
}

enum shaderc_include_type {
    shaderc_include_type_relative,  
    shaderc_include_type_standard  
};