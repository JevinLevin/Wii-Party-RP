#version 330

uniform sampler2D DiffuseSampler;
uniform sampler2D FinalSampler;

in vec2 texCoord;
out vec4 fragColor;

float fadetime = 32.;

void main() {
    vec4 lastglow = texture(DiffuseSampler, vec2(0.2));
    float fade = texture(DiffuseSampler, vec2(0.3)).r;
    vec4 color = vec4(texture(FinalSampler, vec2(0.5)).rgb,1.0);
    
    if (color.a > 0.1 && color.rgb != lastglow.rgb) {
        fade = 1.0;
        lastglow = color;
    }
    else {fade -= 1./fadetime;}

    if (texCoord.x < 0.35) fragColor = vec4(vec3(fade),1.0);
    if (texCoord.x < 0.25) fragColor = lastglow;
    if (texCoord.x < 0.15) fragColor = color;

    //impossible condition thats required for some reason to work
    if (texCoord.x == -1.0) fragColor = texture(DiffuseSampler, texCoord) + texture(FinalSampler, texCoord);
}