void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    
    vec2 p = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;
   
    float d = length(p);
    
    vec3 col = vec3(d);
    
    fragColor = vec4(col, 1.0);
}