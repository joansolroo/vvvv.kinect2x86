//@author: vux
//@help: standard constant shader
//@tags: color
//@credits: 

Texture2D textureXYZ <string uiname="Texture";>;
Texture2D textureColor <string uiname="c texture";>;
Texture2D control <string uiname="Control";>;
float3 scale = {1,1,1};
SamplerState g_samLinear <string uiname="Sampler State";>
{
    Filter = MIN_MAG_MIP_LINEAR;
    AddressU = Clamp;
    AddressV = Clamp;
};

 
cbuffer cbPerDraw : register( b0 )
{
	float4x4 tVP : VIEWPROJECTION;
};


cbuffer cbPerObj : register( b1 )
{
	float4x4 tW : WORLD;
	float Alpha <float uimin=0.0; float uimax=1.0;> = 1; 
	float4 cAmb <bool color=true;String uiname="Color";> = { 1.0f,1.0f,1.0f,1.0f };
	float4x4 tTex <string uiname="Texture Transform"; bool uvspace=true; >;
	float4x4 tColor <string uiname="Color Transform";>;
};

struct VS_IN
{
	float4 PosO : POSITION;
	float4 TexCd : TEXCOORD0;

};

struct vs2ps
{
    float4 PosWVP: SV_POSITION;
    float4 color: COLOR;
	float4 TexCd: TEXCOORD0;
};

vs2ps VS(VS_IN input)
{
    vs2ps Out = (vs2ps)0;
	float2 uv = control.SampleLevel(g_samLinear,input.TexCd.xy,0).rg;
	float4 PosO = input.PosO;
	
		float3 xyz = textureXYZ.SampleLevel(g_samLinear,uv,0).xyz;
		PosO.xyz = xyz*scale;	
		float4 PosOW =  mul(PosO,tW);
	
		Out.PosWVP  = mul(PosOW,tVP);
		Out.color = PosOW;	
	
	
    Out.TexCd = float4(uv,0,1);//mul(input.TexCd, tTex);
    return Out;
}




float4 PS(vs2ps In): SV_Target
{
    float4 col = textureColor.Sample(g_samLinear,In.TexCd.xy) * In.color.y*100;
	col = mul(col, tColor);
	col.a *= Alpha;
	//float4 col = In.color.y*10;
    return col;
}





technique10 Constant
{
	pass P0
	{
		SetVertexShader( CompileShader( vs_4_0, VS() ) );
		SetPixelShader( CompileShader( ps_4_0, PS() ) );
	}
}




