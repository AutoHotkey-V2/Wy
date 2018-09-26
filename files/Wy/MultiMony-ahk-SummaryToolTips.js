NDSummary.OnToolTipsLoaded("File:Wy/MultiMony.ahk",{39:"<div class=\"NDToolTip TClass LAutoHotKey\"><div class=\"TTSummary\">Handling Multiple Display-Monitor Environments</div></div>",41:"<div class=\"NDToolTip TProperty LAutoHotKey\"><div class=\"TTSummary\">Debug flag for debugging the object</div></div>",42:"<div class=\"NDToolTip TProperty LAutoHotKey\"><div class=\"TTSummary\">Get the ID of the primary monitor</div></div>",43:"<div class=\"NDToolTip TProperty LAutoHotKey\"><div class=\"TTSummary\">Get the ID of the monitor where the taskbar is on (aka. primary monitor)</div></div>",44:"<div class=\"NDToolTip TProperty LAutoHotKey\"><div class=\"TTSummary\">Number of available monitors.</div></div>",45:"<div class=\"NDToolTip TProperty LAutoHotKey\"><div class=\"TTSummary\">Get the size of virtual screen in Pixel as a Wy.Recty.</div></div>",46:"<div class=\"NDToolTip TProperty LAutoHotKey\"><div class=\"TTSummary\">Version of the class</div></div>",47:"<div class=\"NDToolTip TProperty LAutoHotKey\"><div class=\"TTSummary\">Get the size of virtual screen in Pixel as a Wy.Recty.</div></div>",49:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype49\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">coordDisplayToVirtualScreen(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">id&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">1</span>,</td></tr><tr><td class=\"PName first\">x&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">0</span>,</td></tr><tr><td class=\"PName first\">y&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">0</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Transforms coordinates relative to given monitor into absolute (virtual) coordinates. Returns object of type Wy.Pointy</div></div>",50:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype50\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">coordVirtualScreenToDisplay(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first last\">x,</td></tr><tr><td class=\"PName first last\">y</td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Transforms absolute coordinates from Virtual Screen into coordinates relative to screen.</div></div>",51:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype51\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">hmonFromCoord(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">x&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHString\">&quot;&quot;</span>,</td></tr><tr><td class=\"PName first\">y&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHString\">&quot;&quot;</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the handle of the monitor containing the specified x and y coordinates.</div></div>",52:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype52\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">hmonFromHwnd(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first last\">hwnd</td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the handle of the monitor containing the swindow with given window handle.</div></div>",53:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype53\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">hmonFromid(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">id&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">1</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the handle of the monitor from monitor id.</div></div>",54:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype54\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">hmonFromRect(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first last\">x,</td></tr><tr><td class=\"PName first last\">y,</td></tr><tr><td class=\"PName first last\">w,</td></tr><tr><td class=\"PName first last\">h</td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the handle of the monitor that has the largest area of intersection with a specified rectangle.</div></div>",55:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype55\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">identify(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">disptime&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">1500</span>,</td></tr><tr><td class=\"PName first\">txtcolor&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHString\">&quot;000000&quot;</span>,</td></tr><tr><td class=\"PName first\">txtsize&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">300</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Identify monitors by displaying the monitor id on each monitor</div></div>",56:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype56\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">idFromCoord(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">x,</td><td></td><td class=\"last\"></td></tr><tr><td class=\"PName first\">y,</td><td></td><td class=\"last\"></td></tr><tr><td class=\"PName first\">default&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">1</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the index of the monitor containing the specified x and y coordinates.</div></div>",57:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype57\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">idFromHwnd(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first last\">hwnd</td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the ID of the monitor containing the swindow with given window handle.</div></div>",58:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype58\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">idFromMouse(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">default</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">1</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the index of the monitor where the mouse is</div></div>",59:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype59\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">idFromHmon(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first last\">hmon</td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the index of the monitor from monitor handle</div></div>",60:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype60\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">idFromRect(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first last\">x,</td></tr><tr><td class=\"PName first last\">y,</td></tr><tr><td class=\"PName first last\">w,</td></tr><tr><td class=\"PName first last\">h</td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Get the ID of the monitor that has the largest area of intersection with a specified rectangle.</div></div>",61:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype61\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">idNext(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">currMon&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">1</span>,</td></tr><tr><td class=\"PName first\">cycle&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHKeyword\">true</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Gets the id of the next monitor.</div></div>",62:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype62\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">idPrev(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">currMon&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHNumber\">1</span>,</td></tr><tr><td class=\"PName first\">cycle&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHKeyword\">true</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Gets the id of the previous monitor</div></div>",63:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype63\" class=\"NDPrototype NoParameterForm\">monitors()</div><div class=\"TTSummary\">Enumerates display monitors and returns an object all monitors (list of Mony object )</div></div>",64:"<div class=\"NDToolTip TFunction LAutoHotKey\"><div id=\"NDPrototype64\" class=\"NDPrototype WideForm CStyle\"><table><tr><td class=\"PBeforeParameters\">__New(</td><td class=\"PParametersParentCell\"><table class=\"PParameters\"><tr><td class=\"PName first\">_debug&nbsp;</td><td class=\"PDefaultValueSeparator\">:=&nbsp;</td><td class=\"PDefaultValue last\"><span class=\"SHKeyword\">false</span></td></tr></table></td><td class=\"PAfterParameters\">)</td></tr></table></div><div class=\"TTSummary\">Constructor (<b>INTERNAL</b>)</div></div>"});