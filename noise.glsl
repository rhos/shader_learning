float random (float seed) {
    return fract(sin(seed) * 43758.5453123);
}

float noise(float y)
{
    return y;
}
float plot(vec2 coords, float y) {
  return smoothstep(y - 0.02, y, coords.y) - smoothstep(y, y + 0.02, coords.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/iResolution.xy;
    st.x *= 10.;
    // st.y -= .5;
    st.y *= 4.;
    //st.x *= 10.0; // Scale the coordinate system by 10
    vec2 ipos = floor(st);  // get the integer coords
    vec2 fpos = fract(st);  // get the fractional coords

    // Assign a random value based on the integer coord
    vec3 color = vec3(random( ipos.x ));

    // Uncomment to see the subdivided grid
    //color = vec3(fpos,0.0);
      // Plot a line
    float y = smoothstep(0.01, 0.99, st.x);
    y = random(ipos.x);
    y = mix(random(ipos.x), random(ipos.x+1.), fpos.x);
    y = mix(random(ipos.x), random(ipos.x+1.), smoothstep(.0, 1., fpos.x));
    float u = fpos.x * fpos.x * (3.0 - 2.0 * fpos.x );
    y = mix(random(ipos.x), random(ipos.x+1.), u);
    float pct = plot(st, y);
    color = pct * vec3(0.0, 1.0, 1.0);

    gl_FragColor = vec4(color,1.0);
}