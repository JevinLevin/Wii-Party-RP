#version 120

// Uniform texture samplers
uniform sampler2D DiffuseSampler;
uniform sampler2D PrevSampler;

varying vec2 texCoord;

void main(){
    vec4 color = texture2D(DiffuseSampler, vec2(0.5));
    if (color.rgb * 255. == vec3(255.0,85.0,85.0)) {
        gl_FragColor = vec4(1,0,0,0.7);
    }
    else if (color.rgb * 255. == vec3(85.0,85.0,85.0)) {
        gl_FragColor = vec4(0,0,0,0);
    }
    else{
        gl_FragColor = texture2D(PrevSampler, vec2(0.5));
    }
}