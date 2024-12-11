#pragma semicolon 1
#include <sourcemod>

int iTickrate;

public OnPluginStart() 
{
	iTickrate = GetCommandLineParamInt("-tickrate", 30);
}

public void OnAutoConfigsBuffered() 
{
	SetRates();
}

void SetRates() 
{
    FindConVar(				"sv_minrate").SetInt( 	iTickrate * 1000,       true, false);
    FindConVar(				"sv_maxrate").SetInt( 	iTickrate * 1000,       true, false);
    FindConVar(		  "sv_minupdaterate").SetInt( 	iTickrate,              true, false);
    FindConVar(       "sv_maxupdaterate").SetInt( 	iTickrate,              true, false);
    FindConVar(			 "sv_mincmdrate").SetInt( 	iTickrate,              true, false);
    FindConVar(			 "sv_maxcmdrate").SetInt( 	iTickrate,              true, false);
    FindConVar("net_splitpacket_maxrate").SetInt(	(iTickrate * 1000) / 2, true, false);
    FindConVar(		  "net_maxcleartime").SetFloat(	0.0001,                 true, false);
}