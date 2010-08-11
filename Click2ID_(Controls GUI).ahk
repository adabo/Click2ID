MouseGetPos, xx, yy, WinID, CtrlCls
PixelGetColor, var11, %xx%, %yy%, Alt RGB
Gui, 10:Color,, % var11
WinGetTitle, WinTtl, AHK_ID %WinID%
WinGetClass, WinCls, AHK_ID %WinID%
WinGetPos, wpxx, wpyy, wpww, wphh, AHK_ID %WinID%
ControlGetText, CtrlTtll, %CtrlCls%, AHK_ID %WinID%
StringReplace, CtrlTtl, CtrlTtll, `r`n , %A_Space%, All
ControlGet, CtrlHwnd, Hwnd,, %CtrlCls%, AHK_ID %WinID%
ControlGet, CtrlHwnd, Hwnd,, %CtrlCls%, AHK_ID %WinID%
ControlGetPos , cxx, cyy, cww, chh,, AHK_ID %CtrlHwnd%
ControlSetText, Edit2, % WinTtl "`r`n" WinID "`r`n" WinCls "`r`n" wpww "`r`n" wphh "`r`n" wpxx "`r`n" wpyy "`r`n____________________________`r`n" CtrlTtl "`r`n" CtrlHwnd "`r`n" CtrlCls "`r`n" cww "`r`n" chh "`r`n" cxx "`r`n" cyy "`r`n____________________________`r`n" xx "`r`n" yy "`r`n" var11, Watcher


ControlList
ControlListHwnd

List
Checked
Visible
Tab
FindString,String
Choice
LineCount
CurrentLinee
CurrentCol
Line,N
Selected
Stylen
ExStyle
Hwnd

/*
;*******************
;
;    Idea
; 3rd tab "Search"
;
; To find Wintitle text
;     or
;ctrl text
;*******************s
*/