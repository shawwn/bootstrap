//----------------------------------------------------------
// File:		Ambient.vsh
// Author:		Kevin Bray
// Created:		02-07-06
// Copyright © 2004 Bootstrap Games.  All rights reserved.
//----------------------------------------------------------

//----------------------------------------------------------
// vertex outputs
varying vec3 v_LocalEyeVec;
varying vec2 v_BumpTexCoord;
varying vec2 v_DiffuseTexCoord;
varying vec2 v_EmissiveTexCoord;
varying vec2 v_AmbientTexCoord;


//----------------------------------------------------------
// uniforms
uniform vec4 u_ViewPos;				// X,Y,Z,undef
uniform vec4 u_BumpTexMatS;
uniform vec4 u_BumpTexMatT;
uniform vec4 u_DiffuseTexMatS;
uniform vec4 u_DiffuseTexMatT;
uniform vec4 u_AmbientTexMatS;
uniform vec4 u_AmbientTexMatT;
uniform vec4 u_EmissiveTexMatS;
uniform vec4 u_EmissiveTexMatT;

//----------------------------------------------------------
// main
void main()
{
	gl_Position = ftransform();
	gl_ClipVertex = gl_Vertex;

	// calculate the eye vector.
	vec3 localEyeVec = u_ViewPos.xyz - gl_Vertex.xyz;

	// transform the eye vector into tangent space.
	v_LocalEyeVec.x = dot( localEyeVec, gl_MultiTexCoord2.xyz );
	v_LocalEyeVec.y = dot( localEyeVec, gl_MultiTexCoord3.xyz );
	v_LocalEyeVec.z = dot( localEyeVec, gl_Normal.xyz );

	// calculate the bump map lookup.
	v_BumpTexCoord.x = dot( gl_MultiTexCoord0, u_BumpTexMatS );
	v_BumpTexCoord.y = dot( gl_MultiTexCoord0, u_BumpTexMatT );

	// calculate the diffuse map lookup.
	v_DiffuseTexCoord.x = dot( gl_MultiTexCoord0, u_DiffuseTexMatS );
	v_DiffuseTexCoord.y = dot( gl_MultiTexCoord0, u_DiffuseTexMatT );

	// calculate the specular map lookup.
	v_EmissiveTexCoord.x = dot( gl_MultiTexCoord0, u_EmissiveTexMatS );
	v_EmissiveTexCoord.y = dot( gl_MultiTexCoord0, u_EmissiveTexMatT );

	// calculate the ambient map lookup.
	v_AmbientTexCoord.x = dot( gl_MultiTexCoord1, u_AmbientTexMatS );
	v_AmbientTexCoord.y = dot( gl_MultiTexCoord1, u_AmbientTexMatT );
}
