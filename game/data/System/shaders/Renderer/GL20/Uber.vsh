//----------------------------------------------------------
// File:		Uber.vsh
// Author:		Kevin Bray
// Created:		09-08-07
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex outputs
varying vec2 v_UberTexCoord;

//----------------------------------------------------------
// uniforms
uniform vec4 u_TexMatS;
uniform vec4 u_TexMatT;

//----------------------------------------------------------
// main
void main()
{
	// transform into world space.
	gl_Position = ftransform();

	// calculate the ubertexture lookup.
	v_UberTexCoord.x = dot( gl_MultiTexCoord0, u_TexMatS );
	v_UberTexCoord.y = dot( gl_MultiTexCoord0, u_TexMatT );
}
