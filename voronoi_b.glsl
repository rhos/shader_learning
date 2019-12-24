vec2 random2( vec2 p ) {
    return fract(sin(vec2(dot(p,vec2(127.1,311.7)),dot(p,vec2(269.5,183.3))))*43758.5453);
}

void main() {
    vec2 st = gl_FragCoord.xy/iResolution.xy;
    st.x *= iResolution.x/iResolution.y;
    vec3 color = vec3(.0);

    // Scale
    st *= 7.;

    // Tile the space
    vec2 i_st = floor(st);
    vec2 f_st = fract(st);

    float m_dist = 1.;  // minimun distance
    vec2 p = vec2(0.);
    for (int y= -1; y <= 1; y++) {
        for (int x= -1; x <= 1; x++) {
            // Neighbor place in the grid
            vec2 neighbor = vec2(float(x),float(y));

            // Random position from current + neighbor place in the grid
            vec2 point = random2(i_st + neighbor);

			// Animate the point
            point = .5 + .5*sin(iGlobalTime + 6.2831*point);

			// Vector between the pixel and the point
            vec2 diff = neighbor + point - f_st;

            // Distance to the point
            float dist = length(diff);

            // Keep the closer distance
            if (dist < m_dist)
            {
              m_dist = dist;
              p = point;
            }
        }
    }

    // Draw the min distance (distance field)
    color += m_dist * 2.;
    color.rg = p;

    // Draw cell center
    color += 1.-step(.02, m_dist);

    // Draw grid
    color.r += step(.98, f_st.x) + step(.98, f_st.y);

    // Show isolines
    color -= abs(sin(80.0*m_dist))*0.07;

    gl_FragColor = vec4(color,1.0);
}