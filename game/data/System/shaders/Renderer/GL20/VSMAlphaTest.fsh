//----------------------------------------------------------
// File:		depth.fsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex inputs
varying vec3 v_LocalEyeVec;
varying vec2 v_TexCoord;
varying vec4 v_Position;

//----------------------------------------------------------
// uniforms
uniform vec4 u_BumpMod;
uniform vec4 u_BumpAdd;
uniform vec4 u_DiffuseMod;
uniform vec4 u_DiffuseAdd;

//----------------------------------------------------------
// samplers
uniform samplerCube s_NormalizeTexCube;
uniform sampler2D s_BumpTex;
uniform sampler2D s_DiffuseTex;

//----------------------------------------------------------
// main
void main()
{
	//----------------------------------------------------
	// normalize incoming vectors.
	//----------------------------------------------------
	// normalize the eye vector using a texture lookup.
	half3 localEyeVec = 2.0 * textureCube( s_NormalizeTexCube, v_LocalEyeVec ).xyz - 1.0;

	//----------------------------------------------------
	// lookup the bump and normal values.
	//----------------------------------------------------
	half bump = texture2D( s_BumpTex, v_TexCoord ).a;
	bump = u_BumpMod.x * bump + u_BumpAdd.x;
	half2 uvOffset = bump * localEyeVec.xy;

	//----------------------------------------------------
	// Calculate the diffuse component.
	//----------------------------------------------------
	half alpha = texture2D( s_DiffuseTex, v_TexCoord + uvOffset ).a;
	alpha = u_DiffuseMod.a * alpha + u_DiffuseAdd.a;

	// output the result.
	gl_FragColor.xyz = v_Position.xyz / v_Position.w;
	gl_FragColor.xy = vec2( 0.25, 0.25 ) * gl_FragColor.xy + vec2( 0.5, 0.5 );
	gl_FragColor.a = alpha;
}
