precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

// CRT scanline effect

void main() {
    vec2 uv = v_texcoord;
    vec4 color = texture2D(tex, uv);

    // Scanlines — alternating dark/bright horizontal lines
    float scanline = sin(uv.y * 1080.0 * 3.14159) * 0.06 + 0.94;

    // Slight horizontal gap between "pixels"
    float pixel_gap = sin(uv.x * 1920.0 * 3.14159) * 0.02 + 0.98;

    // Subtle vignette (darker corners)
    vec2 vig = uv - 0.5;
    float vignette = 1.0 - dot(vig, vig) * 0.35;

    // Very slight color fringing / chromatic aberration
    float r = texture2D(tex, uv + vec2(0.0005, 0.0)).r;
    float b = texture2D(tex, uv - vec2(0.0005, 0.0)).b;
    color.rb = vec2(r, b);

    // Slightly boost contrast for that CRT pop
    color.rgb = (color.rgb - 0.5) * 1.08 + 0.5;

    // Combine everything
    color.rgb *= scanline * pixel_gap * vignette;

    gl_FragColor = color;
}
