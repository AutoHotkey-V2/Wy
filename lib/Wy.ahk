#include %A_LineFile%\..
#Include Const_WinUser.ahk
#Include GdipC\GdipC.ahk

#include Wy\JSON.ahk

#include Wy\Colory.ahk
#include Wy\ScreenSavy.ahk
#include Wy\Mony.ahk
#include Wy\MultiMony.ahk


class Wy {
	_version := "1.0.0"
	__New()  {
	}
	
	__Delete() {
	}

; #region # Nested classes ############################################################################################	

; #region ### [C] Wy.Pointy ###########################################################################################	
	class Pointy extends GdipC.Point
	{
		ToJSON() {
			return "{`"x`":=" this.x ",`"y`":" this.y "}"
		}
	}
; #endregion ### [C] Wy.Pointy ########################################################################################	

; #region ### [C] Wy.Recty ############################################################################################	
	class Recty extends GdipC.Rect
	{
		ToJSON() {
			return "{`"x`":=" this.x ",`"y`":" this.y ",`"width`":" this.width ",`"height`":" this.height "}"
		}
	}
; #endregion ### [C] Wy.Recty #########################################################################################	

; #endregion # Nested classes #########################################################################################	
} ; End of Class Wy