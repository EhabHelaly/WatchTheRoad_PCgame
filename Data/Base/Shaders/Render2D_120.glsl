#version 			120

uniform mat4 		matProjection;
uniform mat4 		matView;
uniform mat4 		matWorld;

attribute vec3		In_Position;
attribute vec2		In_TexCoord;
attribute vec4		In_Color;

varying vec2		Out_TexCoord;
varying vec4		Out_Color;

void 	main()
{
	gl_Position		= matProjection * matView * matWorld * vec4(In_Position, 1.0f);	
	Out_TexCoord 	= In_TexCoord;
	Out_Color 		= In_Color;	
}

/// $SPLIT$ ///

#version 			120

varying vec2		Out_TexCoord;
varying vec4		Out_Color;

uniform	sampler2D	BaseTexture;

void	main()
{
	gl_FragColor	=  0.5f; //texture2D( BaseTexture, Out_TexCoord ) * Out_Color;
}

/// $SPLIT$ ///

; Shader settings ;)
[Locations]
0=In_Position
1=In_TexCoord
2=In_Color