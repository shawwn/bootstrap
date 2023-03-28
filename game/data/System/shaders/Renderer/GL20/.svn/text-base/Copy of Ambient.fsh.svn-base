//----------------------------------------------------------
// File:		Ambient.fsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex inputs
varying vec3 v_LocalEyeVec;
varying vec2 v_BumpTexCoord;
varying vec2 v_DiffuseTexCoord;
varying vec2 v_AmbientTexCoord;
varying vec2 v_EmissiveTexCoord;

//----------------------------------------------------------
// uniforms
uniform vec4 u_BumpMod;
uniform vec4 u_BumpAdd;
uniform vec4 u_DiffuseMod;
uniform vec4 u_DiffuseAdd;
uniform vec4 u_AmbientMod;
uniform vec4 u_AmbientAdd;
uniform vec4 u_EmissiveMod;
uniform vec4 u_EmissiveAdd;
uniform vec4 u_AmbientColor;
uniform vec4 u_FogStart;
uniform vec4 u_FogRange;
uniform vec4 u_FogColor;

//----------------------------------------------------------
// samplers
uniform samplerCube s_NormalizeTexCube;
uniform sampler2D s_BumpTex;
uniform sampler2D s_DiffuseTex;
uniform sampler2D s_EmissiveTex;
uniform sampler2D s_AmbientTex;

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
	half bump = texture2D( s_BumpTex, v_BumpTexCoord ).a;
	bump = half( u_BumpMod.x ) * bump + half( u_BumpAdd.x );
	float2 uvOffset = vec2( bump * localEyeVec.xy );

	//----------------------------------------------------
	// Calculate the diffuse component.
	//----------------------------------------------------
	half4 diffuse = texture2D( s_DiffuseTex, v_DiffuseTexCoord + uvOffset );
	diffuse = u_DiffuseMod * diffuse + u_DiffuseAdd;

	//----------------------------------------------------
	// Calculate the ambience.
	//----------------------------------------------------
	half3 ambient = texture2D( s_AmbientTex, v_AmbientTexCoord ).rgb;
	ambient = u_AmbientMod.rgb * ambient + u_AmbientAdd.rgb;
	ambient *= u_AmbientColor.rgb;
	diffuse.rgb *= ambient;

	//----------------------------------------------------
	// Calculate the emissive component.
	//----------------------------------------------------
	half4 emissive = texture2D( s_EmissiveTex, v_EmissiveTexCoord + uvOffset );
	diffuse.rgb += u_EmissiveMod.rgb * emissive.rgb + u_EmissiveAdd.rgb;

	//----------------------------------------------------
	// Calculate fog.
	//----------------------------------------------------
//	half t = clamp( ( length( v_LocalEyeVec ).x - u_FogStart.x ) / u_FogRange.x, 0.0, 1.0 );
//	diffuse.rgb = mix( diffuse.rgb, u_FogColor.rgb, t );

	// output the result.
	gl_FragColor = diffuse;
}
