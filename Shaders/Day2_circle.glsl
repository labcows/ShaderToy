void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

    vec2 p = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;
   
    float d = distance(vec2(0.0, 0.0), p);    
    
    vec3 col = vec3(0.08, 0.04, 0.12);    
    
    if (d < 0.01)
    {
        col = vec3(1.00, 0.85, 0.45);
    }
    else if (d < 0.085)
    {
        col = vec3(0.45 + d * 0.45, 0.15 + d * 0.2, 0.1 + d * 0.10);
    }
    else if (d < 0.35)
    {
        col = vec3(0.08 + d * 0.5, 0.18 + d * 0.4, 0.28 + d * 0.6);
    }
    
    fragColor = vec4(col, 1.0);
}