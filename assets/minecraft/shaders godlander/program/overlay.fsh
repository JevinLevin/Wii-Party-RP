#version 130

uniform sampler2D DiffuseSampler;

uniform vec4 ColorModulate;

varying vec2 texCoord;

void main(){
  vec4 color = texture(DiffuseSampler, vec2(0.5));  //grab color at center pixel
  if (color.rgb == vec3(1.0,0.333333333,0.333333333)) { //if that color is red
    gl_FragColor = vec4(1.,0.,0.,.1); //tint red
  } else {
    gl_FragColor = vec4(0.); //no tint
  }
}
