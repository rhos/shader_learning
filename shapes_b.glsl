void main(){
    vec2 st = gl_FragCoord.xy/iResolution.xy;
    vec3 color = vec3(0.0);

    // bottom-left
    //vec2 bl = smoothstep(vec2(0.3),vec2(.35),st);
    vec2 bl = abs(floor(st - .8 + .1));
    float pct = bl.x * bl.y;

    // top-right
    //vec2 tr = step(vec2(0.1),1.0-st);
    
    vec2 tr = abs(floor((1.- st - .1) - .8));
    pct *= tr.x * tr.y;

    color = vec3(pct);

    gl_FragColor = vec4(color,1.0);
}