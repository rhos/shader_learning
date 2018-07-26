float circle(in vec2 st, in vec2 center, in float radius)
{
    st = st - center;
    float pct = max(distance(st, vec2(.0)) , distance(st, vec2(.1)));
    pct = pct*1.42;
    //pct = step(.1, pct);
    //pct = 1. - pct;
    pct = smoothstep(radius,radius + abs(.1 * sin(iGlobalTime)),pct);
    pct = 1.-pct;
    return pct;
}

float dotcircles(in vec2 st, in vec2 center, in float radius)
{
    vec2 dist = st-vec2(0.5);
    return smoothstep(radius+(radius*0.1),
                         radius-(radius*0.1),
                         dot(dist,dist)*4.0);
}
void main(){
	vec2 st = gl_FragCoord.xy/iResolution.xy;

    // a. The DISTANCE from the pixel to the center
    //pct = distance(st,vec2(0.5));

    // b. The LENGTH of the vector
    //    from the pixel to the center
    //vec2 toCenter = vec2(0.5)-st;
    //pct = length(toCenter);

    float c1 = circle(st, vec2(0.4, 0.3), 0.0);
    float c2 = dotcircles(st, vec2(0.8, 0.5), 0.2);
    vec3 color = vec3(max(c1,c2), .0, .0);


	gl_FragColor = vec4( color, 1.0 );
}


