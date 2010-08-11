;-- Draw ----
+LButton::
{
  CoordMode, Mouse, Screen
  KeyWait, LButton, D
  MouseGetPos, dx, dy, dt
  Loop
  {
    CoordMode, Mouse, Screen
    MouseGetPos, hx, hy, ht
    GoSub Tool
    If not GetKeyState("LButton", "P")
    {
      Break
    }
    ToolTip, %gwin% `n----`nx: %wtx% y: %wty%`n`n----`nCustom`n----``nx: %tw% y: %th%
  }
}
Exit
;-- Move ----
+^LButton::
{
  CoordMode, Mouse, Screen
  WinGetPos, ffx, ffy, ffw, ffh, Gui1
  KeyWait, LButton, D
  MouseGetPos, mvdx, mvdy
  xx := mvdx - ffx
  yy := mvdy - ffy
  Loop
  {
    MouseGetPos, qx, qy
    Gui, 1:Show, % "x"(qx - xx) "y"(qy - yy), Gui1
    If not GetKeyState("lButton", "P")
    {
      Break
    }
    ToolTip, %gwin% `n----`nx: %wtx% y: %wty%`n`n----`nCustom`n----``nx: %qx% y: %qy%
  }
}
Exit
;-- GUI/Controls Resize --
LShift & ^RButton::
{
  WinGetPos, wgx, wgy, fw, fh, Gui1
  MouseGetPos, ddx, ddy
  dfx := fw - ddx
  dfy := fh - ddy
  Loop
  {
    MouseGetPos, hhx, hhy, ht
    ww := dfx + hhx
    hh := dfy + hhy
    Gui, 1:Show, x%wgx% y%wgy% w%ww% h%hh%
    If not GetKeyState("RButton", "P")
    {
      Break
    }
    ToolTip, %gwin% `n----`nx: %wtx% y: %wty%`n`n----`nCustom`n----``nx: %wgx% y: %wgy%
  }
}
Exit

Tool:
MouseGetPos, tx,ty, twin
WinGetPos, wtx, wty, tw, th, Gui1
WinGetTitle, gwin, AHK_ID %twin%
CoordMode, Tooltip, Relative
If (dx < hx) and (dy < hy)
{
   ;ToolTip, >v
  ;Gui, 1:Add, GroupBox, w%tw% h%th%
  Gui, 1:-Caption ;-SysMenu
  Gui, 1:Color, 0xD4D0C8
  Gui, 1:Show, % "x"(dx) "y"(dy) "w"(hx - dx) "h"(hy - dy), Gui1
  WinSet, TransColor, 0xD4D0C8, Gui1
}
If(dx < hx) and (dy > hy)
{
   ;ToolTip, >^
  Gui, 1:Show, % "x"(dx) "y"(hy) "w"(hx - dx) "h"(dy - hy), Gui1
  WinSet, TransColor, 0xD4D0C8, Gui1
}
If (dx > hx) and (dy < hy)
{
   ;ToolTip, <v
  Gui, 1:Show, % "x"(hx) "y"(dy) "w"(dx - hx) "h"(hy - dy), Gui1
  WinSet, TransColor, 0xD4D0C8, Gui1
}
If (dx > hx) and (dy > hy)
{
   ;ToolTip, <^
  Gui, 1:Show, % "x"(hx) "y"(hy) "w"(dx - hx) "h"(dy - hy), Gui1
  WinSet, TransColor, 0xD4D0C8, Gui1
}
Return