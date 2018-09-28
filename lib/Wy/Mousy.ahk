; ****** HINT: Documentation can be extracted to HTML using NaturalDocs (http://www.naturaldocs.org/) ************** 

#include %A_LineFile%\..
#include MultiMony.ahk
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
	debug[] { ; _DBG_
   	/* -------------------------------------------------------------------------------
	Property: debug [get/set]
	Debug flag for debugging the object

	Value:
	flag - *true* or *false*
	*/
		get {
			return this._debug
		}
		set {
			mode := value<1?0:1
			this._debug := mode
			return this._debug
		}
	}
	monitorID[] {
	/* ---------------------------------------------------------------------------------------
	Property: monitorID [get/set]
	Get or Set the monitor the mouse is currently on
	*/
		get {
			md := new MultiMony(this._debug)
			return md.idFromMouse()
		}
		set {
			currMon := this.monitorID
			dbgOut("=[" A_ThisFunc "()] - >New:" value "<-> Current:" CurrMon, this.debug)
			if (value != currMon) {
				md := new MultiMony(this._debug)
				; Determine relative Coordinates relative to current monitor
				curr := md.coordVirtualScreenToDisplay(this.x,this.y) 
				; Determine scaling factors from current monitor to destination monitor
				monCurr := new Mony(currMon, this._debug)
				scaleX := monCurr.scaleX
				scaleY := monCurr.scaleY
				mon := new Mony(value, this._debug)
				r := mon.boundary
				; Scale the relative coordinates and add them to the origin of destination monitor
				x := r.x + scaleX*curr.pt.x
				y := r.y + scaleY*curr.pt.y
				; Move the mouse onto new monitor
				this.__move(x, y)
			}
			return this.monitorID
		}
	}
	moveable[] {
	/* ---------------------------------------------------------------------------------------
	Property: movable [get/set]
	Get or Sets the posibility to move the mouse via user's physical movement

	Value:
	flag - True or False
	*/
		get {
			return this._bIsMoveable
		}
		set {
			this._bIsMoveable := value
			if (value == true)
				BlockInput("MouseMoveOff")
			else 
				BlockInput("MouseMove")
			return value
		}
	}
	moveMode[] {
	/* ---------------------------------------------------------------------------------------
	Property: moveMode [get/set]
	Movement mode while moving the mouse via <pos at http://hoppfrosch.github.io/AHK_Windy/files/Mousy-ahk.html#pos>, <x at http://hoppfrosch.github.io/AHK_Windy/files/Mousy-ahk.html#x>, <y at http://hoppfrosch.github.io/AHK_Windy/files/Mousy-ahk.html#y>

	This has to be a value out of 
	
	 * 0: mouse jumps immediatialy to the new position
	 * 1: mouse moves to new position following a linear track (default)
	 * 2: mouse moves to new position following a random track jittering along a line
	 * 3: mouse moves to new position following a random track following a bezier curce

	The speed of the movement can be set via <moveSpeed at http://hoppfrosch.github.io/AHK_Windy/files/Mousy-ahk.html#moveSpeed>
	*/
		get {
			return this._movemode
		}
		set {
			if (value < 0)
				value := 0
			if (value > 3)
				value := 3
			this._movemode := value
			return value
		}
	}
	moveSpeed[] {
	/* ---------------------------------------------------------------------------------------
	Property: moveSpeed [get/set]
	Speed while moving the mouse via <pos at http://hoppfrosch.github.io/AHK_Windy/files/Mousy-ahk.html#pos>, <x at http://hoppfrosch.github.io/AHK_Windy/files/Mousy-ahk.html#x>, <y at http://hoppfrosch.github.io/AHK_Windy/files/Mousy-ahk.html#y>

	This has to be a value from range [0 (instant) ..100 (slow)]
	*/
		get {
			return this._movespeed
		}
		set {
			if (value < 0)
				value := 0
			if (value > 100)
				value := 100
			this._movespeed := value
			return value
		}
	}
	pos[] {
	/* ---------------------------------------------------------------------------------------
	Property: pos [get/set]
	Get or Set position of mouse as a <point at http://hoppfrosch.github.io/AHK_Windy/files/Pointy-ahk.html>

	See also: 
	<x  [get/set]>, <y  [get/set]>
	*/
		get {
			ret := Wy.Pointy.fromMouse()
			dbgOut("=[" A_ThisFunc "()] -> " ret.toJson(), this.debug)
			return ret
		}
		
		set {
			this.__move(value.x, value.y)
			dbgOut("=[" A_ThisFunc "(" value.toJson() ")]", this.debug)
			return value
		}
	}
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
	x[] {
	/* ---------------------------------------------------------------------------------------
	Property: x [get/set]
	Get or Set x-coordinate of mouse

	See also: 
	<pos [get/set]>, <y [get/set]>
	*/
		get {
			dbgOut("=[" A_ThisFunc "()] -> " this.pos.x, this.debug)
			return this.pos.x
		}
		
		set {
			dbgOut(">[" A_ThisFunc "(value=" value ")]", this.debug)
			this.__move(value, this.y)
			dbgOut("<[" A_ThisFunc "(value=" value ")]", this.debug)
			return value
		}
	}
	y[] {
	/* ---------------------------------------------------------------------------------------
	Property: y [get/set]
	Get or Set y-coordinate of mouse

	See also: 
	<pos [get/set]>, <x [get/set]>
	*/
		get {
			dbgOut("=[" A_ThisFunc "()] -> " this.pos.y, this.debug)
			return this.pos.y
		}
		
		set {
			dbgOut(">[" A_ThisFunc "(value=" value ")]", this.debug)
			this.__move(this.x, value)
			dbgOut("<[" A_ThisFunc "(value=" value ")]", this.debug)
			return value
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
		this.moveable := 1
	  	dbgOut("=" A_ThisFunc "([" this.hwnd "]): Mouse moveable? " this.moveable, this.debug)	
	}
	/* ---------------------------------------------------------------------------------------
	Method:  __move
	Moves the mouse to given coordinates (*INTERNAL*)

	Parameters:
	x,y - Coordinates to move to
	*/
	__move(x,y, mode := -1, speed := -1) {
		dbgOut(">[" A_ThisFunc "(x=" x ",y=" y ",mode=" mode ",speed=" speed ")]", this.debug)	
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
		dbgOut("<[" A_ThisFunc "(x=" x ",y=" y ",mode=" mode ",speed=" speed ")]", this.debug)	
	}
	/* ---------------------------------------------------------------------------------------
	Method:  __moveRandomBezier
	Moves the mouse to given coordinates on a random path, following a bezier curve  (*INTERNAL*)

	Parameters:
	x,y - Coordinates to move to

	Authors:
	* Original: <masterfocus at https://github.com/MasterFocus/AutoHotkey/tree/master/Functions/RandomBezier>
	*/
	__moveRandomBezier(x, y, Speed:=-1) {
		if (speed == -1) {
			speed := this._movespeed
		}
		time := 5000/100 * speed
		T := A_MouseDelay
		SetMouseDelay(-1)
		MouseGetPos(CX, CY)
		;RandomBezier(CX, CY, x, y, "T" time)
		SetMouseDelay(T)
	}
	/* ---------------------------------------------------------------------------------------
	Method:  __moveRandomLinear
	Moves the mouse to given coordinates on a random path, jittering along a line (*INTERNAL*)

	Parameters:
	x,y - Coordinates to move to

	Authors:
	* Original: <slanter me at http://slanter-ahk.blogspot.de/2008/12/ahk-random-mouse-path-mousemove.html>
	*/
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
}
