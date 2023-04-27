#version 300 es
precision mediump float;

// Input
in vec2 model_uv;
in vec3 diffuse_illum;
in vec3 specular_illum;

// Uniforms
// material
uniform vec3 mat_color;
uniform vec3 mat_specular;
uniform sampler2D mat_texture;
// light from environment
uniform vec3 ambient; // Ia

// Output
out vec4 FragColor;

void main() {
    vec3 model_color = mat_color * texture(mat_texture, model_uv).rgb;

    // Color
    //diffuse_illum *= model_color;
    //specular_illum *= mat_specular;

    vec3 ambient_illum = ambient * model_color;

    // will be ambient_illum + diffuse_illum + specular_illum
    FragColor = vec4(diffuse_illum, 1.0);
}
