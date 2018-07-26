#ifdef GL_ES
precision mediump float;
#endif
float PI = 3.14159265359;
// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 coords, float y) {
  return smoothstep(y - 0.02, y, coords.y) - smoothstep(y, y + 0.02, coords.y);
}

void main() {
  vec2 st = gl_FragCoord.xy / iResolution.xy;
  st = (st - .5) * 4.;
  float x = st.x;

  //float y = sin(st.x*3.14159265359);
  //float y = 1. - pow(abs(x), .5);
  //float y = pow(cos(PI *x), 0.5);
  float y = step(0.5, st.x);
  // Plot a line
  float pct = plot(st, y);
  vec3 color = (1.0 - pct) * vec3(0.0, 0.0, 0.0) + pct * vec3(0.0, .5, .5);

  gl_FragColor = vec4(color, 1.0);
}