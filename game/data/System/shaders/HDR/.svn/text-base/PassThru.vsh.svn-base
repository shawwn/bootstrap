//----------------------------------------------------------
// File:		PassThru.vsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex outputs
varying vec2 v_TexCoord;

//----------------------------------------------------------
// uniforms
uniform vec4 u_TexCoordScale;

//----------------------------------------------------------
// main
void main()
{
	gl_Position = ftransform();
	v_TexCoord.xy = u_TexCoordScale.xy * gl_MultiTexCoord0.xy;
}
