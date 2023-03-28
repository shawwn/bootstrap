//----------------------------------------------------------
// File:		Ambient.vsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex outputs
varying vec2 v_EmissiveTexCoord;

//----------------------------------------------------------
// uniforms
uniform vec4 u_TexMatS;
uniform vec4 u_TexMatT;

//----------------------------------------------------------
// main
void main()
{
	gl_Position = ftransform();

	// calculate the specular map lookup.
	v_TexCoord.x = dot( gl_MultiTexCoord0, u_TexMatS );
	v_TexCoord.y = dot( gl_MultiTexCoord0, u_TexMatT );
}
