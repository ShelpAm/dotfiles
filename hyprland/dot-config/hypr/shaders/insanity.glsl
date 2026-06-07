precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

// Insanity shader v2 — animated, reality is actively falling apart

void main() {
    vec2 uv = v_texcoord;
    vec2 center = uv - 0.5;
    float dist = length(center);

    // Barrel distortion — breathing in and out
    float breathe = 1.0 + sin(time * 0.4) * 0.04;
    float warp = 1.0 + dist * dist * 0.15 * breathe;
    uv = 0.5 + center * warp;

    // RGB split — oscillating, tearing worse over time
    float split = dist * (0.004 + sin(time * 0.7) * 0.003);
    float angle = time * 0.3;
    vec2 dir = vec2(cos(angle), sin(angle)) * split;
    float r = texture2D(tex, uv + dir).r;
    float g = texture2D(tex, uv).g;
    float b = texture2D(tex, uv - dir).b;
    vec4 color = vec4(r, g, b, 1.0);

    // Desaturation — pulsing, sometimes almost normal, then drained
    float sat = 0.3 + sin(time * 0.25) * 0.3 + sin(time * 0.7) * 0.1;
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    color.rgb = mix(color.rgb, vec3(gray), sat);

    // Cold tint pulsing
    float cold = 0.5 + sin(time * 0.35) * 0.5;
    color.r -= cold * 0.06;
    color.b += cold * 0.08;

    // Exposure flicker — subtle
    float flicker = 1.0 + sin(time * 1.7) * 0.03 + sin(time * 13.7) * 0.02;
    color.rgb = (color.rgb - 0.06) * flicker + 0.06;

    // Vignette — pulsing darkness
    float vig_strength = 1.5 + sin(time * 0.5) * 0.3;
    float vignette = 1.0 - dist * vig_strength;
    vignette = clamp(vignette, 0.0, 1.0);
    vignette = vignette * vignette;
    color.rgb *= vignette;

    // Sickly green in shadows — creeps in and out
    float sick = sin(time * 0.2) * 0.5 + 0.5;
    color.rgb += vec3(-0.02, 0.04, -0.02) * (1.0 - vignette) * sick;

    // Random scanline glitch — brief horizontal black lines
    float glitch = sin(uv.y * 400.0 + time * 20.0);
    glitch = step(0.97, abs(glitch)) * 0.3;
    color.rgb -= glitch;

    gl_FragColor = color;
}
