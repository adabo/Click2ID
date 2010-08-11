CoordMode, ToolTip, Screen
Loop,
{
  Gui, Destroy
  MouseGetPos,xx,yy, UniqueID, ClassNN
  MouseGetPos,,,, CHWnd, 2
  WinGetTitle, WTitle, AHK_Id %UniqueID%
  PixelGetColor, cColor, %xx%, %yy%, Slow|RGB
  ToolTip, % "UniqueID is: " . UniqueID . "`nClassnn is: " . ClassNN . "`nControl's HWnd is: " . CHWnd . "`nWindow's title is: " . WTitle . "`nPixel's color is:" . cColor . "`n`n(Click Right Mouse button anywhere.)", % A_ScreenWidth/2, A_ScreenHeight/2,
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
      {
        Break
      }
      Sleep, 1
    }
  }
  MouseGetPos,,,, CHWnd2, 2
  If (CHWnd == CHWnd2)
  {
    ;Msgbox, :)
    Loop
    {
      MouseGetPos,,,, CHWnd2, 2
      If (CHWnd != CHWnd2)
      {
        Break
      }
      Sleep, 1
    }
  }
  Sleep, 1
}