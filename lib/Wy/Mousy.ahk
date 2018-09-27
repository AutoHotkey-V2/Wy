; ****** HINT: Documentation can be extracted to HTML using NaturalDocs (http://www.naturaldocs.org/) ************** 

#include %A_LineFile%\..
#include Mony.ahk
#include %A_LineFile%\..\..
#include Wy.ahk
#include Const_WinUser.ahk

class Mousy {
	/* ******************************************************************************************************************************************
	Class: Mousy
    	Toolset to handle mousecursor within a MultiMonitorEnvironment

	Authors:	<hoppfrosch at hoppfrosch@gmx.de>: Original
	*/

	_version := "0.1.0"
	_debug := 0 ; _DBG_	
	_showLocatorAfterMove := 1

	_bConfine := false
	_confineRect := new Wy.Recty()
	_movespeed := 50
	_movemode := 1 
	_bIsMoveable := true

	; ===== Properties ===============================================================
	version[] {
    /* -------------------------------------------------------------------------------
	Property: version [get]
	Version of the class

	Remarks:
	* There is no setter available, since this is a constant system property
	*/
		get {
			return this._version
		}
	}

	/* ---------------------------------------------------------------------------------------
	Method: locate
	Easy find the mouse
	*/
	locate() {
	
		applicationname := A_ScriptName
		
		SetWinDelay(0)
		DetectHiddenWindows("On")
		CoordMode("Mouse","Screen")
		
		delay := 100
		size     := [250,  200,   150,     100,   50]
		col      := ["Red","Blue","Yellow","Lime","Green"]
		boldness := [700,  600,   500,     400,  300]
		OutputVar:=Chr(177)

		MousyGUI := []		
		Loop 5
		{ 
			MouseGetPos(x,y) 
			width:=Round(size[A_Index]*1.4)
			height:=Round(size[A_Index]*1.4)

			MousyGUI[A_Index] := GuiCreate()
			MousyGUI[A_Index].Options("+Owner")
			MousyGUI[A_Index].Options("+AlwaysOnTop")
			MousyGUI[A_Index].Options("-Resize")
			MousyGUI[A_Index].Options("-SysMenu")
			MousyGUI[A_Index].Options("-MinimizeBox")
			MousyGUI[A_Index].Options("-MaximizeBox")
			MousyGUI[A_Index].Options("-Disabled")
			MousyGUI[A_Index].Options("-Caption")
			MousyGUI[A_Index].Options("-Border")
			MousyGUI[A_Index].Options("-ToolWindow")
			MousyGUI[A_Index].MarginX := 0
			MousyGUI[A_Index].MarginY := 0
			MousyGUI[A_Index].BackColor := "gray"
			MousyGUI[A_Index].SetFont("c" . col[A_Index] . " S" . size[A_Index] . " W" . boldness[A_Index],  "Wingdings")
			MousyGUI[A_Index].Add("Text",, OutputVar)
			MousyGUI[A_Index].Title := Applicationname . A_Index
			MousyGUI[A_Index].Show("X" . x-width . " Y" . y-height . " W" . width . " H" . Height . "NoActivate")
			WinSetTransColor("gray",  Applicationname . A_Index)

			MouseGetPos(x,y)
			WinMove(x-size[A_Index]/1.7, y-size[A_Index]/1.4,,, Applicationname . A_Index)
			WinShow(Applicationname . A_Index)
			Sleep(delay)
			WinHide(applicationname . A_Index)
		}
		
		Loop 5
		{ 
			MousyGUI[A_Index].Destroy()
		}
	}

	; ===== Internal Methods =========================================================
	/* -------------------------------------------------------------------------------
	Constructor: __New
	Constructor (*INTERNAL*)
		
	Parameters:
	debug - Flag to enable debugging (Optional; Default: 0)
	*/  
	__New( debug := false ) {
		this._debug := debug ; _DBG_
		dbgOut("=[" A_ThisFunc ")] (version: " this._version ")", this.debug)
	}
	/* ---------------------------------------------------------------------------------------
	Method: __Delete
	Destructor (*INTERNAL*)
	*/ 
	__Delete() {
		dbgOut(">" A_ThisFunc "([" this.hwnd "])", this.debug)
		this.moveable := 1
	  dbgOut("|" A_ThisFunc "([" this.hwnd "]): Mouse moveable? " this.moveable, this.debug)	
		dbgOut("<" A_ThisFunc "([" this.hwnd "])", this.debug)
	}
	/* ---------------------------------------------------------------------------------------
	Method:  __move
	Moves the mouse to given coordinates (*INTERNAL*)

	Parameters:
	x,y - Coordinates to move to
	*/
	/*  
	__move(x,y, mode := -1, speed := -1) {
		if (speed == -1) {
			speed := this._movespeed
		}
		if (mode == -1) {
			mode := this._movemode
		}
		T := A_MouseDelay
		SetMouseDelay(-1)
		CoordMode("Mouse", "Screen")
		if (mode == 0) {
			MouseMove(x, y, 0)
		}
		else if (mode == 1) {
			MouseMove(x, y, speed)
		}
		else if (mode == 2) {
			this.__moveRandomLinear(x, y, speed)
		}
		else if (mode == 3) {
			this.__moveRandomBezier(x, y, speed)
		}
		if (this.showLocatorAfterMove == 1)
			this.locate()
		SetMouseDelay(T)
	}
	*/
	/* ---------------------------------------------------------------------------------------
	Method:  __moveRandomBezier
	Moves the mouse to given coordinates on a random path, following a bezier curve  (*INTERNAL*)

	Parameters:
	x,y - Coordinates to move to

	Authors:
	* Original: <masterfocus at https://github.com/MasterFocus/AutoHotkey/tree/master/Functions/RandomBezier>
	*/
	/*
	__moveRandomBezier(x, y, Speed:=-1) {
		if (speed == -1) {
			speed := this._movespeed
		}
		time := 5000/100 * speed
		T := A_MouseDelay
		SetMouseDelay(-1)
		MouseGetPos(CX, CY)
		RandomBezier(CX, CY, x, y, "T" time)
		SetMouseDelay(T)
	}
	*/
	/* ---------------------------------------------------------------------------------------
	Method:  __moveRandomLinear
	Moves the mouse to given coordinates on a random path, jittering along a line (*INTERNAL*)

	Parameters:
	x,y - Coordinates to move to

	Authors:
	* Original: <slanter me at http://slanter-ahk.blogspot.de/2008/12/ahk-random-mouse-path-mousemove.html>
	*/
	/*
	__moveRandomLinear(x, y, Speed := -1) {
		if (speed == -1) {
			speed := this._movespeed
		}
		T := A_MouseDelay
		SetMouseDelay(-1)
		MouseGetPos(CX, CY)
		Pts := Round(Sqrt((X - CX)**2 + (Y - CY)**2) / 30,0)
		Loop Pts {
			NX := Random(CX - ((CX - X) / Pts) * (A_Index - 1), CX - ((CX - X) / Pts) * A_Index)
			NY := Random(CY - ((CY - Y) / Pts) * (A_Index - 1), CY - ((CY - Y) / Pts) * A_Index)
			MouseMove(NX, NY, speed)
		}
		MouseMove(X,Y,Speed)
		SetMouseDelay(T)
	}
	*/
}
