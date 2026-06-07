precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

// Summer shader — warm sunlight, vibrant greens and blues, bright air

void main() {
    vec2 uv = v_texcoord;
    vec4 color = texture2D(tex, uv);

    // Warm golden sunlight — push reds, lift yellows
    color.r *= 1.03;
    color.g *= 1.02;
    color.b *= 0.95;

    // Boost vibrance — saturate blues and greens more than reds
    float sat = 1.12;
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    color.rgb = mix(vec3(gray), color.rgb, sat);

    // Lift shadows slightly — airy, no heavy blacks
    color.rgb = (color.rgb + 0.03) / 1.03;

    // Gentle brightness boost
    color.rgb *= 1.04;

    // Barely-there vignette
    float dist = length(uv - 0.5);
    float vignette = 1.0 - dist * dist * 0.10;
    color.rgb *= vignette;

    gl_FragColor = color;
}
