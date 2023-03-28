//----------------------------------------------------------
// File:		PassThru.vsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex outputs
varying vec2 v_TexCoord0;
varying vec2 v_TexCoord1;

//----------------------------------------------------------
// uniforms
uniform vec4 u_TexCoordScale;

//----------------------------------------------------------
// main
void main()
{
	gl_Position = ftransform();
	v_TexCoord0.xy = u_TexCoordScale.xy * gl_MultiTexCoord0.xy;
	v_TexCoord1.xy = 0.5 * v_TexCoord0.xy;
}
