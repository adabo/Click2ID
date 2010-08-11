CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen
Loop,
{
  MouseGetPos, xx1, yy1, WinID, CtlID
  WinGetTitle, WinTtl, AHK_ID %WinID%
  ToolTip, % WinTtl . "`n1: " . WinID . "`n2: " . WinID2 . "`n: " . A_Index,,, 1
  IfWinNotExist
  {
      ; MsgBox, A_Index = 1
      WinGetPos, xx2, yy2, ww, hh, AHK_ID %WinID%
      Gui, Add, Edit, % "-VScroll" . " " . "x" . xx2 . " " . "y" . yy2 . " " .  "w" . ww . " " . "h" . hh 
      Gui, -Caption +ToolWindow
      Gui, Color, 0x000000
      Gui, +LastFound
      Winset, TransColor, 0xFFFFFF 216
      Gui, Show, % "w" . A_ScreenWidth . "h" . A_ScreenHeight, guitrans  ; 
      ;Continue
      MouseGetPos, xx1, yy1, WinID2, CtlID
  }
  If (WinID != WinID2) && (WinTtl != "guitrans")
  {
    ToolTip, WinID = WinID2 WinTtl != guitrans, % xx1 + 25, % yy1 - 25, 2
    MouseGetPos,,, WinID2, CtlID2
    WinGetPos, xx2, yy2, ww, hh, AHK_ID %WinID2%
    ControlMove, Edi1, %xx2%, %yy2%, %ww%, %hh%, guitrans
    Continue    
  }
  If (WinID = WinID2) && (WinTtl = "guitrans")
  {
   ToolTip, WinID = WinID2 WinTtl = guitrans, % xx1 + 25, % yy1 - 25, 2
   Gui, Show, Minimize, guitrans
   MouseGetPos,,, WinID2, CtlID2
   Continue
  }
  If (
  {
    
  }
  If (WinID = WinID2) && (WinTtl != "guitrans")
  {
    MouseGetPos,,, WinID3, CtlID2
    Continue
  }
    Tooltip,,,, 2
    Gui, Show, Maximize, guitrans
    MouseGetPos,,, WinID2, CtlID2
    WinGetPos, xx2, yy2, ww, hh, AHK_ID %WinID2%
    ;MsgBox, xx2 %xx2% yy2 %yy2%
    ControlMove, Edi1, %xx2%, %yy2%, %ww%, %hh%, guitrans
    ;MsgBox, WinID != WinID2 %ErrorLevel%
    ;Continue

   /*
  If (WinTtl = "guitrans")
  {
   Gui, Show, Minimize, guitrans
   MouseGetPos,,, WinID2, CtlID2
    ;MsgBox, winhidden
  }
  */
}
ExitApp 