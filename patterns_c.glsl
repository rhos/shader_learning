vec2 brickTile(vec2 _st, float _zoom){
    _st *= _zoom;
    vec2 yoff = _st;
    vec2 xoff = _st;
    // Here is where the offset is happening
    xoff.x += step(1., mod(_st.y,2.0)) * .5 * iGlobalTime;
    xoff.x -= step(1., mod(_st.y + 1.,2.0)) * .5 * iGlobalTime;
    yoff.y += step(1., mod(_st.x,2.0)) * .5 * iGlobalTime;
    yoff.y -= step(1., mod(_st.x + 1.,2.0)) * .5 * iGlobalTime;
    vec2 off = mod(iGlobalTime, 4.) <= 2.0 ? yoff : xoff;
    return fract(off);
}

float box(vec2 _st, vec2 _size){
    _size = vec2(0.5)-_size*0.5;
    vec2 uv = smoothstep(_size,_size+vec2(1e-4),_st);
    uv *= smoothstep(_size,_size+vec2(1e-4),vec2(1.0)-_st);
    return uv.x*uv.y;
}

float circle(in vec2 _st, in float _radius){
    vec2 l = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(l,l)*4.0);
}

void main(void){
    vec2 st = gl_FragCoord.xy/iResolution.xy;
    st.x *= iResolution.x/iResolution.y;
    vec3 color = vec3(0.0);

    st = brickTile(st,7.0);

    color = vec3(circle(st,0.4));

    // Uncomment to see the space coordinates
    //color = vec3(st,0.0);

    gl_FragColor = vec4(color,1.0);
}