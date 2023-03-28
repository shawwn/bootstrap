//----------------------------------------------------------
// File:		reflect.vsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//==========================================================
// vertex outputs.
//==========================================================
varying vec3 v_LocalEyeVec;
varying vec4 v_ReflectTexCoord;
varying vec2 v_TexCoord;

//==========================================================
// uniforms.
//==========================================================
uniform vec4 u_ViewPos;				// X,Y,Z,undef
uniform vec4 u_TexMatS;
uniform vec4 u_TexMatT;

//==========================================================
// main.
//==========================================================
void main()
{
	gl_Position = ftransform();

	// calculate the eye vector.
	vec3 localEyeVec = u_ViewPos.xyz - gl_Vertex.xyz;

	// transform the eye vector into tangent space.
	v_LocalEyeVec.x = dot( localEyeVec, gl_MultiTexCoord2.xyz );
	v_LocalEyeVec.y = dot( localEyeVec, gl_MultiTexCoord3.xyz );
	v_LocalEyeVec.z = dot( localEyeVec, gl_Normal.xyz );

	// calculate the reflection texture coordinate.
	v_ReflectTexCoord = ftransform();
	v_ReflectTexCoord.x = 0.5 * v_ReflectTexCoord.x + 0.5 * v_ReflectTexCoord.w;
	v_ReflectTexCoord.y = 0.5 * v_ReflectTexCoord.y + 0.5 * v_ReflectTexCoord.w;

	// calculate the bump map lookup.
	v_TexCoord.x = dot( gl_MultiTexCoord0, u_TexMatS );
	v_TexCoord.y = dot( gl_MultiTexCoord0, u_TexMatS );
}
