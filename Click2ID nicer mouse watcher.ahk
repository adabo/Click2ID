Session:
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Gui, +AlwaysOnTop -SysMenu -Caption +Border
Gui, Font, s9, Terminal
Gui, Add, Edit, +ReadOnly -VScroll +Right x0 y0 w74 h235,  ; Edit1
Gui, Add, Edit, +ReadOnly -VScroll +HScroll x74 y0 w185 h279,  ; Edit2
Gui, Add, Edit, x0 y237 w78 h60 -VScroll, 
Gui, Show, x0 w260 h280 , Guixyz
ControlSetText, Edit1, % "WinTitle`r`nI.D.`r`nClass`r`nWidth`r`nHeight`r`nX-pos`r`nY-pos`r`n________`r`nControl`r`nHwnd/ID`r`nClassNN`r`nWidth`r`nHeight`r`nX-pos`r`nY-pos`r`n________`r`nMouse-X`r`nMouse-Y`r`nColor", Guixyz

Loop,
{
  MouseGetPos, xx, yy, WinID, CtrlCls
  PixelGetColor, var11, %xx%, %yy%, Alt RGB
  Gui, Color,, % var11
  WinGetTitle, WinTtl, AHK_ID %WinID%
  WinGetClass, WinCls, AHK_ID %WinID%
  WinGetPos, wpxx, wpyy, wpww, wphh, AHK_ID %WinID%
  ControlGetText, CtrlTtll, %CtrlCls%, AHK_ID %WinID%
  StringReplace, CtrlTtl, CtrlTtll, `r`n , %A_Space%, All
  ControlGet, CtrlHwnd, Hwnd,, %CtrlCls%, AHK_ID %WinID%
  ControlGetPos , cxx, cyy, cww, chh,, AHK_ID %CtrlHwnd%
  ControlSetText, Edit2, % WinTtl "`r`n" WinID "`r`n" WinCls "`r`n" wpww "`r`n" wphh "`r`n" wpxx "`r`n" wpyy "`r`n______________________`r`n" CtrlTtl "`r`n" CtrlHwnd "`r`n" CtrlCls "`r`n" cww "`r`n" chh "`r`n" cxx "`r`n" cyy "`r`n____________________________`r`n" xx "`r`n" yy "`r`n" var11, Guixyz
  Loop,
  {
    MouseGetPos, xx2, yy2
    If  (xx2 != xx) || (yy2 != yy)
    {
      Break
    }
    /*
    If GetKeyState("LButton", "P")
    {
      SendInput, {LButton Down}
      Break
    }
    */
  }
  /*
  If GetKeyState("LButton", "P")
  {
    Break
  }
  */
  Sleep, 45
}
SendInput, {LButton Up}
Gui, Destroy
MsgBox, 4, Restart?, Would you like to continue monitoring?
IfMsgBox, Yes
{
  GoSub, Session
}
Msgbox, Goodbye!

GuiClose:
ExitApp