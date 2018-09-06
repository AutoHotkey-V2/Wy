#SingleInstance force

#Include %A_ScriptDir%\Yunit\Yunit.ahk
#Include %A_ScriptDir%\Yunit\Window.ahk
#Include %A_ScriptDir%\Yunit\OutputDebug.ahk

#include %A_ScriptDir%\..\lib\Wy.ahk
#include %A_ScriptDir%\..\lib\Wy\DbgOut.ahk

#Warn All
#Warn LocalSameAsGlobal, Off

ReferenceVersion := "0.1.0"
debug := 1
OutputDebug "DBGVIEWCLEAR"


; Yunit.Use(YunitStdOut, YunitWindow).Test(OperatorTestSuite, ConstructTestSuite, MiscTestSuite)
Yunit.Use(YunitOutputDebug, YunitWindow).Test(VersionTestSuite, MiscTestSuite)
Return

class VersionTestSuite
{
	Begin() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
	}
	
	Version() {
		Global debug
		Global ReferenceVersion
		obj := new Colory(,,debug)
		Yunit.assert(obj._version == ReferenceVersion)
	}

	End() {
		Global debug
		dbgOut("<[" A_ThisFunc "]", debug)
	}
}


class MiscTestSuite
{
	Begin() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
	}
	
	Constructor() {
		Global debug
		obj := new Colory(0,100,110,120,debug)
		Yunit.assert(obj.a == 0)
		Yunit.assert(obj.r == 100)
		Yunit.assert(obj.g == 110)
		Yunit.assert(obj.b == 120)
	}
	FromRGB() {
		Global debug
		obj := Colory.fromRGB("0x112233")
		Yunit.assert(obj.a == 0)
		Yunit.assert(obj.r == 17)
		Yunit.assert(obj.g == 34)
		Yunit.assert(obj.b == 51)
	}
	ToHex() {
		Global debug
		col := "0x112233"
		obj := Colory.fromRGB(col)
		Yunit.assert(obj.hex == col)
	}
	End() {
		Global debug
		dbgOut("<[" A_ThisFunc "]", debug)
	}
}

/*
class OperatorTestSuite
{
	Begin() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		this.pt := new Pointy(100,100,debug)
	}
	
	Add() {
		Global debug
		obj1 := new Pointy(100,110,debug)
		obj2 := new Pointy(10,10,debug)
		obj1.Add(obj2)
		Yunit.assert(obj1.x == 110)
		Yunit.assert(obj1.y == 120)
	}
	Sub() {
		Global debug
		obj1 := new Pointy(100,110,debug)
		obj2 := new Pointy(10,10,debug)
		obj1.Sub(obj2)
		Yunit.assert(obj1.x == 90)
		Yunit.assert(obj1.y == 100)
	}
	
	Equal() {
		comp := new Pointy(this.pt.x, this.pt.y, 0)
		Yunit.assert(this.pt.equal(comp) == true)
		return
	}
	
	NotEqual() {
		comp := new Pointy(this.pt.x + 10, this.pt.y, 0)
		Yunit.assert(this.pt.equal(comp) == false)
		return
	}
		
	End() {
		Global debug
		dbgOut("<[" A_ThisFunc "]", debug)
	}
}
*/