CoordMode, ToolTip, Screen
Loop,
{
  ;Gui, Destroy
  MouseGetPos,xx,yy, UniqueID, ClassNN
  MouseGetPos,,,, CHWnd, 2
  WinGetTitle, WTitle, AHK_Id %UniqueID%
  PixelGetColor, cColor, %xx%, %yy%, Slow|RGB
  Gui, 4:-SysMenu -Caption
  Gui, 4:Show, w40 h40
  Gui, 4:Color, %cColor%
  ToolTip, % "UniqueID is: " . UniqueID . "`nClassnn is: " . ClassNN . "`nControl's HWnd is: " . CHWnd . "`nWindow's title is: " . WTitle . "`nPixel's color is:" . cColor . "`n`n(Click Right Mouse button anywhere.)", % A_ScreenWidth/2, A_ScreenHeight/2+30,
  If GetKeyState("RButton", "P")
  {
    Break
  }
  IfInString, WTitle, UniqueID
  {
    Loop
    {
      MouseGetPos,xx,yy, UniqueID, ClassNN
      WinGetTitle, WTitle, AHK_Id %UniqueID%
      IfNotInString, WTitle, UniqueID
  ;Gui, 4:-SysMenu -Caption
  ;Gui, 4:Color, %cColor%
  ;Gui, 4:Show, w30
      {
        Break
      }
      Sleep, 1
    }
  }
  MouseGetPos,xx,yy, UniqueID, ClassNN
  PixelGetColor, cColor2, %xx%, %yy%, Slow|RGB
  ;Gui, 4:-SysMenu -Caption
  ;Gui, 4:Show, w30 h30
  ;Gui, 4:Color, %cColor%
  If (cColor == cColor2)
  {
    ;Msgbox, :)
    Loop
    {
  MouseGetPos,xx,yy, UniqueID, ClassNN
  PixelGetColor, cColor2, %xx%, %yy%, Slow|RGB
  ;Gui, 4:-SysMenu -Caption
  ;Gui, 4:Color, %cColor%
  ;Gui, 4:Show, w30 h30
      If (cColor != cColor2)
      {
        Break
      }
      Sleep, 1
    }
  }
  Sleep, 1
}