precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

// Subtle filmic color grade — no blur, no glow, just nice colors

void main() {
    vec2 uv = v_texcoord;
    vec4 color = texture2D(tex, uv);

    // S-curve contrast — deeper shadows, brighter highlights, no washout
    color.rgb = (color.rgb - 0.5) * 1.10 + 0.5;

    // Gentle warm shift — slightly golden
    color.r *= 1.02;
    color.g *= 1.00;
    color.b *= 0.96;

    // Subtle vignette — barely there
    float dist = length(uv - 0.5);
    float vignette = 1.0 - dist * dist * 0.18;
    color.rgb *= vignette;

    gl_FragColor = color;
}
