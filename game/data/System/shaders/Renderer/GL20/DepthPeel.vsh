//----------------------------------------------------------
// File:		depthpeel.vsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex outputs
varying vec4 v_TopLayerTexCoord;

//----------------------------------------------------------
// main
void main()
{
	gl_Position = ftransform();

	// calculate the top layer lookup.
	v_TopLayerTexCoord.x = 0.5 * gl_Position.x + 0.5 * gl_Position.w;
	v_TopLayerTexCoord.y = 0.5 * gl_Position.y + 0.5 * gl_Position.w;
	v_TopLayerTexCoord.z = gl_Position.z;
	v_TopLayerTexCoord.w = gl_Position.w;
}
