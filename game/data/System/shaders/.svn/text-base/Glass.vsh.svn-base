//----------------------------------------------------------
// File:		glass.vsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//==========================================================
// vertex outputs.
//==========================================================
varying vec3 v_LocalEyeVec;
varying vec3 v_LocalLightVec;
varying vec4 v_ProjTexCoord;
varying vec4 v_ShadowTexCoord;
varying vec2 v_TexCoord;

//==========================================================
// uniforms.
//==========================================================
uniform vec4 u_ViewPos;				// X,Y,Z,undef
uniform vec4 u_LightPos;			// X,Y,Z,undef
uniform vec4 u_LightDirOverride;	// X,Y,Z,[0=override;1=no override]
uniform vec4 u_LightProjS;
uniform vec4 u_LightProjT;
uniform vec4 u_LightProjR;
uniform vec4 u_LightProjQ;
uniform vec4 u_ShadowTexGenS;
uniform vec4 u_ShadowTexGenT;
uniform vec4 u_ShadowTexGenR;
uniform vec4 u_ShadowTexGenQ;
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

	// calculate the light vector.
	vec3 localLightVec = u_LightPos.xyz - gl_Vertex.xyz;
	localLightVec = u_LightDirOverride.w * localLightVec + u_LightDirOverride.xyz;

	// transform the eye vector into tangent space.
	v_LocalEyeVec.x = dot( localEyeVec, gl_MultiTexCoord1.xyz );
	v_LocalEyeVec.y = dot( localEyeVec, gl_MultiTexCoord2.xyz );
	v_LocalEyeVec.z = dot( localEyeVec, gl_Normal.xyz );

	// transform the light vector into tangent space.
	v_LocalLightVec.x = dot( localLightVec, gl_MultiTexCoord1.xyz );
	v_LocalLightVec.y = dot( localLightVec, gl_MultiTexCoord2.xyz );
	v_LocalLightVec.z = dot( localLightVec, gl_Normal.xyz );

	// evaluate the projected texture texgens.
	v_ProjTexCoord.x = dot( gl_Vertex, u_LightProjS );
	v_ProjTexCoord.y = dot( gl_Vertex, u_LightProjT );
	v_ProjTexCoord.z = dot( gl_Vertex, u_LightProjR );
	v_ProjTexCoord.w = dot( gl_Vertex, u_LightProjQ );

	// evaluate the shadow texture texgens.
	v_ShadowTexCoord.x = dot( gl_Vertex, u_ShadowTexGenS );
	v_ShadowTexCoord.y = dot( gl_Vertex, u_ShadowTexGenT );
	v_ShadowTexCoord.z = dot( gl_Vertex, u_ShadowTexGenR );
	v_ShadowTexCoord.w = dot( gl_Vertex, u_ShadowTexGenQ );

	// calculate the bump map lookup.
	v_TexCoord.x = dot( gl_MultiTexCoord0, u_TexMatS );
	v_TexCoord.y = dot( gl_MultiTexCoord0, u_TexMatT );
}
