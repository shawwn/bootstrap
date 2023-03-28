//----------------------------------------------------------
// File:		depthmerge.vsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex outputs
varying vec2 v_TexCoord;

//----------------------------------------------------------
// main
void main()
{
	// calculate the output position.
	gl_Position = ftransform();

	// set the output texture coordinate.
	v_TexCoord = gl_MultiTexCoord0.xy;
}
