#ifdef GL_ES
precision mediump float;
#endif

// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 coords, float y) {
  return smoothstep(y - 0.02, y, coords.y) - smoothstep(y, y + 0.02, coords.y);
}

void main() {
  vec2 st = gl_FragCoord.xy / iResolution.xy;

  // float y = pow(st.x, 5.0);
  // float y = st.x;
   float y = smoothstep(0.2,1.,st.x) ;//- smoothstep(0.5,0.8,st.x);
  //float y = sin(iGlobalTime + st.x*3.14159265359*4.) / 2. + .5;

  vec3 color = vec3(y);

  // Plot a line
  float pct = plot(st, y);
  color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

  gl_FragColor = vec4(color, 1.0);
}