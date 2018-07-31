float plot(float f, float y) {
  return smoothstep(y - 0.02, y, f) - smoothstep(y, y + 0.02, f);
}

void main(){
    vec2 st = gl_FragCoord.xy/iResolution.xy;
    vec3 color = vec3(0.0);

    vec2 pos = -.5+st;

    float r = length(pos)*2.;
    float a = atan(pos.y,pos.x);
    a = a + iGlobalTime;
    float f = cos(a*4.);
    f = abs(cos(a*3.));
    f = abs(cos(a*2.5))*.5+.3;
    f = abs(cos(a*12.)*sin(a*3.))*.8+.1;
    f = smoothstep(-.5,1., cos(a*10.))*.2+0.5 + 0.3 * sin(iGlobalTime);

    color = vec3( 1.-smoothstep(f-.01,f+0.01,r) );
    color = vec3(plot(f,r));
    f = abs(cos(a*12.)*sin(a*3.))*.8+.1;
    //color = color - vec3( 1.-smoothstep(f-.01,f+0.01,r) );
    gl_FragColor = vec4(color, 1.0); 
}