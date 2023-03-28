//----------------------------------------------------------
// File:		Ambient.fsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex inputs
varying vec2 v_TexCoord;

//----------------------------------------------------------
// uniforms
uniform vec4 u_EmissiveMod;
uniform vec4 u_EmissiveAdd;

//----------------------------------------------------------
// samplers
uniform sampler2D s_EmissiveTex;

//----------------------------------------------------------
// main
void main()
{
	//----------------------------------------------------
	// Calculate the emissive component.
	//----------------------------------------------------
	half4 emissive = texture2D( s_EmissiveTex, v_TexCoord );
	emissive.rgb = u_EmissiveMod.rgb * emissive.rgb + u_EmissiveAdd.rgb;

	// output the result.
	gl_FragColor = emissive;
}
