void main(){
  vec2 st = gl_FragCoord.xy/iResolution.xy;
  //st.x *= iResolution.x/iResolution.y;
  vec3 color = vec3(0.0);
  float d = 0.0;

  // Remap the space to -1. to 1.
  st = st *2.-1.;

  // Make the distance field
  vec2 pct = abs(st)-.5;
  d = length( pct );// + iGlobalTime * 0.1;
  //d = length( min(abs(st)-.5,0.) );
  //d = length( max(abs(st)-.5,0.) );

  // Visualize the distance field
  //gl_FragColor = vec4(vec3(.0,fract(d*10.0),.0),1.0);

  // Drawing with the distance field
  gl_FragColor = vec4(vec3( step(d,.3) ),1.0);
  //gl_FragColor = vec4(vec3( step(.3,d) * step(d,.4)),1.0);
  //gl_FragColor = vec4(vec3(smoothstep(.3,.4,d)*
//                            smoothstep(.6,.5,d)) ,1.0);
}