#version 			130

uniform mat4 		matProjection;
uniform mat4 		matView;
uniform mat4 		matWorld;

layout(location = 0) in vec3	In_Position;
layout(location = 1) in vec2	In_TexCoord;
layout(location = 2) in vec4	In_Color;

out vec2			Out_TexCoord;
out vec4			Out_Color;

void 	main()
{
	gl_Position		= matProjection * matView * matWorld * vec4(In_Position, 1.0f);	
	Out_TexCoord 	= In_TexCoord;
	Out_Color 		= In_Color;	
}

/// $SPLIT$ ///

#version 			130

in vec2				Out_TexCoord;
in vec4				Out_Color;
out vec4 			Out;

uniform	sampler2D	BaseTexture;

void	main()
{
	Out				= texture( BaseTexture, Out_TexCoord ) * Out_Color;
	Out 			+= 0.5f;
}

/// $SPLIT$ ///

; Shader settings ;)
[Locations]
0=In_Position
1=In_TexCoord
2=In_Color