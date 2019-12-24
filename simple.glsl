#ifdef GL_ES
precision mediump float;
#endif
float PI = 3.14159265359;
// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 coords, float y) {
  return smoothstep(y - 0.02, y, coords.y) - smoothstep(y, y + 0.02, coords.y);
}

float rand(float a)
{
  return fract(sin(a)*1.784);
}

void main() {
  vec2 st = gl_FragCoord.xy / iResolution.xy;
  st = (st - .5) * 15.;
  float x = st.x;

  // float y = sin(st.x*3.14159265359);
  float i = floor(x);  
  float f = fract(x);  
  // y = rand(i);
  // y = mix(rand(i), rand(i + 1.0), f);
  // y = mix(rand(i), rand(i + 1.0), smoothstep(0.,1.,f));
  float u = f * f * (3.0 - 2.0 * f ); 
  float y = mix(rand(i), rand(i + 1.0), smoothstep(0.25,0.75,f)) * .5; 
  // y = random(st);
  //float y = 1. - pow(abs(x), .5);
  //float y = pow(cos(PI *x), 0.5);
  //float y = step(0.5, st.x);
  // Plot a line
  float pct = plot(st, y) + plot(st, 1.f) + plot(st, 0.f) + plot(st, -1.f);
  vec3 color = (1.0 - pct) * vec3(0.0, 0.0, 0.0) + pct * vec3(0.0, .5, .5);

  gl_FragColor = vec4(color, 1.0);
}