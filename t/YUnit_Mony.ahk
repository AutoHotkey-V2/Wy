#SingleInstance force

#Include %A_ScriptDir%\Yunit\Yunit.ahk
#Include %A_ScriptDir%\Yunit\Window.ahk
#Include %A_ScriptDir%\Yunit\OutputDebug.ahk

#include %A_ScriptDir%\..\lib\Wy.ahk
#include %A_ScriptDir%\..\lib\Wy\DbgOut.ahk
#include %A_ScriptDir%\..\lib\Wy\Mony.ahk

#Warn All
#Warn LocalSameAsGlobal, Off

ReferenceVersion := "0.1.0"
debug := 1

OutputDebug "DBGVIEWCLEAR"

;Yunit.Use(YunitOutputDebug, YunitWindow).Test(TmpMonyTestSuite)
Yunit.Use(YunitOutputDebug, YunitWindow).Test(VersionTestSuite, MonyTestSuite)
Return

class TmpMonyTestSuite {
	Begin() {
		Global debug
		this.monCount := 3
		this.mon1Width := 1920
		this.mon1Height := 1200
		this.mon2Width := 1920
		this.mon2Height := 1080
		this.mon3Width := 1536
		this.mon3Height := 864	
	}	

	center() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		pt1 := mon1.center
		b1 := mon1.boundary
		mon2 := new Mony(2, debug)
		Yunit.assert(pt1.x == this.mon1Width/2)
		Yunit.assert(pt1.y == this.mon1Height/2)
		pt2 := mon2.center
		b2 := mon2.boundary
		Yunit.assert(pt2.x == b2.x + this.mon2Width/2)
		Yunit.assert(pt2.y == b2.y + this.mon2Height/2)
		mon3 := new Mony(3, debug)
		pt3 := mon3.center
		b3 := mon3.boundary
		Yunit.assert(pt3.x == b3.x + this.mon3Width/2)
		Yunit.assert(pt3.y == b3.y + this.mon3Height/2)
		dbgOut("<[" A_ThisFunc "]", debug)
	}

	End()  {
	}
}

; #####################################################################################################################
class MonyTestSuite {
	Begin() {
		Global debug
		this.monCount := 3
		this.mon1Width := 1920
		this.mon1Height := 1200
		this.mon2Width := 1920
		this.mon2Height := 1080
		this.mon3Width := 1536
		this.mon3Height := 864	
	}
	
	_constructor() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		Yunit.assert(mon1 != false)
		mon99 := new Mony(99, debug)
		Yunit.assert(mon99 = false)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	boundary() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		rect1 := mon1.boundary
		Yunit.assert((rect1.width - rect1.x) == this.mon1Width)
		Yunit.assert((rect1.height - rect1.y) == this.mon1Height)	
		mon2 := new Mony(2, debug)
		rect2 := mon2.boundary
		Yunit.assert((rect2.width - rect2.x) == this.mon2Width)
		Yunit.assert((rect2.height - rect2.y) == this.mon2Height)
		Yunit.assert(rect2.x == rect1.width)
		Yunit.assert(rect2.y == rect1.y)
		Yunit.assert(rect2.width == rect1.width + this.mon2Width)
		Yunit.assert(rect2.height == this.mon2Height)
		mon3 := new Mony(3, debug)
		rect3 := mon3.boundary
		Yunit.assert((rect3.width - rect3.x) == this.mon3Width)
		Yunit.assert((rect3.height - rect3.y) == this.mon3Height)
		Yunit.assert(rect3.x == rect2.width)
		Yunit.assert(rect3.y == rect2.y)
		Yunit.assert(rect3.width == rect2.width + this.mon3Width)
		Yunit.assert(rect3.height == this.mon3Height)
		dbgOut("<[" A_ThisFunc "]", debug)
	}

	center() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		pt1 := mon1.center
		b1 := mon1.boundary
		mon2 := new Mony(2, debug)
		Yunit.assert(pt1.x == this.mon1Width/2)
		Yunit.assert(pt1.y == this.mon1Height/2)
		pt2 := mon2.center
		b2 := mon2.boundary
		Yunit.assert(pt2.x == b2.x + this.mon2Width/2)
		Yunit.assert(pt2.y == b2.y + this.mon2Height/2)
		mon3 := new Mony(3, debug)
		pt3 := mon3.center
		b3 := mon3.boundary
		Yunit.assert(pt3.x == b3.x + this.mon3Width/2)
		Yunit.assert(pt3.y == b3.y + this.mon3Height/2)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	coordDisplayToVirtualScreen() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		mon2 := new Mony(2, debug)
		mon3 := new Mony(3, debug)
		pt := mon1.coordDisplayToVirtualScreen(10, 10)
		Yunit.assert(pt.x == 10)
		Yunit.assert(pt.y == 10)
		pt := mon2.coordDisplayToVirtualScreen(10, 10)
		Yunit.assert(pt.x == this.mon1Width + 10)
		Yunit.assert(pt.y == 10)
		pt := mon3.coordDisplayToVirtualScreen(10, 10)
		Yunit.assert(pt.x == this.mon1Width + this.mon2Width + 10)
		Yunit.assert(pt.y == 10)
		dbgOut("<[" A_ThisFunc "]", debug)
		return
	}

	hmon() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		Yunit.assert(mon1.hmon > 0)
		mon2 := new Mony(2, debug)
		Yunit.assert(mon2.hmon > 0)
		Yunit.assert(mon2.hmon != mon1.hmon)
		mon3 := new Mony(3, debug)
		Yunit.assert(mon3.hmon > 0)
		Yunit.assert(mon3.hmon != mon2.hmon)
		Yunit.assert(mon3.hmon != mon1.hmon)

		dbgOut("<[" A_ThisFunc "]", debug)
		return
	}
	
	identify() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		mon1.identify(500)
		mon2 := new Mony(2, debug)
		mon2.identify(500)
		mon3 := new Mony(3, debug)
		mon3.identify(500)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	idNextPrev() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		
		; Monitor 1
		mon1 := new Mony(1, debug)
		monNxt := mon1.idNext
		Yunit.assert(monNxt == 2)
		monNxt := mon1.idNext[0]
		Yunit.assert(monNxt == 2)
		monNxt := mon1.idNext[1]
		Yunit.assert(monNxt == 2)
		
		monPrv := mon1.idPrev
		Yunit.assert(monPrv == 3)
		monPrv := mon1.idPrev[0]
		Yunit.assert(monPrv == 1)
		monPrv := mon1.idPrev[1]
		Yunit.assert(monPrv == 3)

		; Monitor 2 ....
		mon2 := new Mony(2, debug)
		monNxt := mon2.idNext
		Yunit.assert(monNxt == 3)
		monNxt := mon2.idNext[0]
		Yunit.assert(monNxt == 3)
		monNxt := mon2.idNext[1]
		Yunit.assert(monNxt == 3)
		
		monPrv := mon2.idPrev
		Yunit.assert(monPrv == 1)
		monPrv := mon2.idPrev[0]
		Yunit.assert(monPrv == 1)
		monPrv := mon2.idPrev[1]
		Yunit.assert(monPrv == 1)
		
		; Monitor 3 ....
		Mon3 := new Mony(3, debug)
		monNxt := Mon3.idNext
		Yunit.assert(monNxt == 1)
		monNxt := Mon3.idNext[0]
		Yunit.assert(monNxt == 3)
		monNxt := Mon3.idNext[1]
		Yunit.assert(monNxt == 1)
		
		monPrv := Mon3.idPrev
		Yunit.assert(monPrv == 2)
		monPrv := Mon3.idPrev[0]
		Yunit.assert(monPrv == 2)
		monPrv := Mon3.idPrev[1]
		Yunit.assert(monPrv == 2)
		dbgOut("<[" A_ThisFunc "]", debug)
	}

	monitorsCount() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		cnt := mon1.monitorsCount
		Yunit.assert(cnt == this.monCount)
		dbgOut("<[" A_ThisFunc "]", debug)
	}

	primary() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		Yunit.assert(mon1.primary = true)
		mon2 := new Mony(2, debug)
		Yunit.assert(mon2.primary = false)
		mon3 := new Mony(3, debug)
		Yunit.assert(mon3.primary = false)
		dbgOut("<[" A_ThisFunc "]", debug)
	}
	
	rectToPercent() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		rect := new Wy.Recty(integer(this.mon1Width/10),integer(this.mon1Height/10),integer(this.mon1Width/5),integer(this.mon1Height/4))
		per := mon1.rectToPercent(rect)
		Yunit.assert(per.x == 100/10)
		Yunit.assert(per.y == 100/10)
		Yunit.assert(per.w == 100/5)
		Yunit.assert(per.h == 100/4)
		dbgOut("<[" A_ThisFunc "]", debug)
	}

	size() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		sx := mon1.scaleX[1]
		Yunit.assert(sx == 1)
		sy := mon1.scaleY[1]
		Yunit.assert(sy == 1)
		sc := mon1.scale[1]
		Yunit.assert(sc.x == 1)
		Yunit.assert(sc.y == 1)

		sx := mon1.scaleX[2]
		sx := Round(sx*1000)/1000
		dx := this.mon2Width/this.mon1Width
		dx := Round(dx*1000)/1000
		Yunit.assert(Round(sx*1000)/1000 == Round(dx*1000)/1000)
		sy := mon1.scaleY[2]
		dy := this.mon2Height/this.mon1Height
		Yunit.assert(Round(sy*1000)/1000 == Round(dy*1000)/1000)
		sc := mon1.scale[2]
		Yunit.assert(Round(sc.x*1000)/1000 == Round(dx*1000)/1000)
		Yunit.assert(Round(sc.y*1000)/1000 == Round(dy*1000)/1000)

		sx := mon1.scaleX[3]
		sx := Round(sx*1000)/1000
		dx := this.mon3Width/this.mon1Width
		dx := Round(dx*1000)/1000
		Yunit.assert(Round(sx*1000)/1000 == Round(dx*1000)/1000)
		sy := mon1.scaleY[3]
		dy := this.mon3Height/this.mon1Height
		Yunit.assert(Round(sy*1000)/1000 == Round(dy*1000)/1000)
		sc := mon1.scale[3]
		Yunit.assert(Round(sc.x*1000)/1000 == Round(dx*1000)/1000)
		Yunit.assert(Round(sc.y*1000)/1000 == Round(dy*1000)/1000)
		dbgOut("<[" A_ThisFunc "]", debug)
	}

	virtualScreenSize() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		rect := mon1.virtualScreenSize
		Yunit.assert(rect.x == 0)
		Yunit.assert(rect.y == 0)
		Yunit.assert(rect.width == (this.mon1Width + this.mon2Width + this.mon3Width))
		Yunit.assert(rect.height == this.mon1Height)
		dbgOut("<[" A_ThisFunc "]", debug)
	}

	workingArea() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		mon1 := new Mony(1, debug)
		rect := mon1.workingArea
		Yunit.assert(rect.width <= this.mon1Width)
		Yunit.assert(rect.height <= this.mon1Height)	
		dbgOut("<[" A_ThisFunc "]", debug)
	}
;
	End()  {
	}
	
}

class VersionTestSuite {
	Begin() {
	}
	
	Version() {
		Global debug
		dbgOut(">[" A_ThisFunc "]", debug)
		Global ReferenceVersion
		iMony := new Mony(1, debug)
		dbgOut("= Mony Version <" iMony.version "> <-> Required <" ReferenceVersion ">")
		Yunit.assert(iMony.version == ReferenceVersion)
		dbgOut("<[" A_ThisFunc "]", debug)
	}

	End() {
	}
}
