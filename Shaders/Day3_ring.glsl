vec3 getRGB(float col)
{
    float pulse = 0.5 + 0.5 * sin(iTime * 0.8);
    
    return vec3(
        col * (0.2 + 0.3 * pulse),
        col * (0.3 + 0.2 * pulse),
        col * (0.2 + 0.2 * pulse)
    );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    vec2 p = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;
    
    float d = length(p);
    
    float edge = 0.01;    
    float radius = 0.1 + 0.05 * sin(iTime * 0.5);
    
    float outer = 1.0 - smoothstep(radius-edge, radius, d);
    float inner = 1.0 - smoothstep(radius-edge * 5.0, radius-edge, d);
    
    float ring = outer - inner;

    vec3 bg = 0.5 + 0.5 * cos(iTime + d * 6.0 + vec3(1.0, 7.0, 1.0));
    bg *= 0.4;
    vec3 col = mix(bg, getRGB(ring), ring);
    
    fragColor = vec4(col,1.0);
}