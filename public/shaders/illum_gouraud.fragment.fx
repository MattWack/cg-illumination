#version 300 es
precision highp float;

// Attributes
in vec3 position;
in vec3 normal;
in vec2 uv;

// Uniforms
// projection 3D to 2D
uniform mat4 world;
uniform mat4 view;
uniform mat4 projection;
// material
uniform vec2 texture_scale;
uniform float mat_shininess;
// camera
uniform vec3 camera_position;
// lights
uniform int num_lights;
uniform vec3 light_positions[8];
uniform vec3 light_colors[8]; // Ip

// Output
out vec2 model_uv;
out vec3 diffuse_illum;
out vec3 specular_illum;

void main() {
<<<<<<< HEAD
    // Normal Transformation and Other Vectors
    mat3 normTransform = inverse(transpose(mat3(world)));
    vec3 n = normalize(normTransform * normal);
    vec3 l = normalize(normTransform * light_positions[0]);
    vec3 r = normalize(reflect(l, n));
    vec3 v = normalize(position - camera_position);

    // Diffuse Illumination (Ignoring Color - In Fragment Shader)
    diffuse_illum = vec3(0.0, 0.0, 0.0);
    diffuse_illum = light_colors[0] * max(dot(n, l), 0.0);

    // Specular Illumination (Ignoring Specularness - In Fragment Shader)
    specular_illum = vec3(0.0, 0.0, 0.0);
    specular_illum = light_colors[0] * (pow(max(dot(r, v), 0.0), mat_shininess));

    // Pass vertex texcoord onto the fragment shader
    model_uv = uv;

    // Transform and project vertex from 3D world-space to 2D screen-space
    gl_Position = projection * view * world * vec4(position, 1.0);
}
=======
    vec3 model_color = mat_color * texture(mat_texture, model_uv).rgb;

    vec3 dIllum = diffuse_illum * model_color;
    vec3 sIllum = specular_illum * mat_specular;
    vec3 aIllum = ambient * model_color;

    FragColor = vec4(aIllum + dIllum + sIllum, 1.0);
}
>>>>>>> 2ceab61d24043c004bc9996e50673bba397e7d56
