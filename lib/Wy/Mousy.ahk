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
}
