precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

// Warm dreamy shader — soft bloom, warm tint, gentle vignette

void main() {
    vec2 uv = v_texcoord;
    vec4 color = texture2D(tex, uv);

    // Soft glow — sample neighbours and blend (pseudo-bloom)
    vec4 glow = vec4(0.0);
    float s = 0.002;
    glow += texture2D(tex, uv + vec2(-s, -s));
    glow += texture2D(tex, uv + vec2( s, -s));
    glow += texture2D(tex, uv + vec2(-s,  s));
    glow += texture2D(tex, uv + vec2( s,  s));
    glow *= 0.25;
    color.rgb = mix(color.rgb, glow.rgb, 0.15);

    // Warm tint — push toward sunset gold
    color.r *= 1.04;
    color.g *= 0.98;
    color.b *= 0.90;

    // Slight desaturation for that film look
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    color.rgb = mix(color.rgb, vec3(gray), 0.08);

    // Soft vignette — darken edges gently
    float dist = length(uv - 0.5) * 1.2;
    float vignette = 1.0 - dist * dist * 0.45;
    vignette = smoothstep(0.0, 1.0, vignette);

    // Brighten center slightly (like a soft spotlight)
    float center_glow = 1.0 - dist * 0.15;
    color.rgb *= vignette * center_glow;

    // Lift blacks slightly for that hazy, airy feel
    color.rgb = (color.rgb - 0.02) / 0.98;

    gl_FragColor = color;
}
