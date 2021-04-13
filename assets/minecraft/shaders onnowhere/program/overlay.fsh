#version 120

uniform sampler2D DiffuseSampler;
uniform sampler2D TintSampler;

uniform vec4 ColorModulate;

varying vec2 texCoord;

void main(){
    vec4 screenColor = texture2D(DiffuseSampler, texCoord);
    vec4 tintColor = texture2D(TintSampler, vec2(0.5));
    gl_FragColor = (screenColor + tintColor);

}
