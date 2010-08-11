





;;;;;;
;
;Shift + LButton + drag to make your box in all directions
;Shift + Control + LButton + Drag to move the window(Not necessary to click on the GUI to move it)
;Shift + RButton + Drag to resize the GUI in from ">v"(Drag right and down).
;
;;;;;;

#SingleInstance Force

KeyWait, Shift, U
KeyWait, Shift, D

Gx := 1
;-- Draw ----
*+LButton::
{
  CoordMode, Mouse, Screen
  ;KeyWait, LButton, D
  MouseGetPos, dx, dy, dt
  x := 0 - dx
  y := 0 - dy
  Gui, 11:Color, 0xFF00FF  ; % CC
  Gui, 11: +ToolWindow -Caption
  Gui, 11: +AlwaysOnTop
  Gui, 11: +Border
  Loop
  {
    MouseGetPos, hx, hy, ht
    ToolTip, % "Width: " . x + hx . "`nHeight: " . y + hy
    If (dx < hx) and (dy < hy)
    {
       ;ToolTip, >v
Func1()
    }
    If(dx < hx) and (dy > hy)
    {
       ;ToolTip, >^
Func2()
    }
    If (dx > hx) and (dy < hy)
    {
       ;ToolTip, <v
Func3()
    }
    If (dx > hx) and (dy > hy)
    {
       ;ToolTip, <^
  Gui, 11:Show, % "x"(hx) "y"(hy) "w"(dx - hx) "h"(dy - hy), Click2ID Measure
    }
    WinSet, TransColor, 0xFFFFFF 120, Click2ID Measure  ; % CC
    If Not GetKeyState("LButton", "P")
    {
      ;MsgBox, break
      setw := x + hx
      sety := y + hy
      Break
    }
    If Not GetKeyState("Shift", "P")
    {
      ExitApp
    }
  }
  ;MsgBox, Loop out
}
;MsgBox, block out
Loop,
{
  ToolTip, :D
  ;If GetKeyState("LButton", "P")
  ;{
  ;  Break
  ;}
     If Not GetKeyState("Shift", "P")
  {
    ExitApp
  }
}
ToolTip,
Return

;-- Move ----
+^LButton::
{
  CoordMode, Mouse, Screen
  WinGetPos, ffx, ffy, ffw, ffh, Click2ID Measure
  KeyWait, LButton, D
  MouseGetPos, mvdx, mvdy
  xx := mvdx - ffx
  yy := mvdy - ffy
  Gui, 11:Color, 0xFF00FF  ; % CC
  Gui, 11: +ToolWindow -Caption
  Gui, 11: +AlwaysOnTop
  Gui, 11: +Border
  Gui, 11:Show,, Click2ID Measure
  Loop
  {
    MouseGetPos, qx, qy
    Gui, 11:Show, % "x"(qx - xx) "y"(qy - yy), Click2ID Measure
    If not GetKeyState("lButton", "P")
    {
      Break
    }
    If Not GetKeyState("Shift", "P")
    {
      ExitApp
    }
  }
}
Loop,
{
  ;If GetKeyState("LButton", "P")
  ;{
  ;  Exit
  ;}
  If Not GetKeyState("Shift", "P")
  {
    ExitApp
  }
}
Return

;-- GUI/Controls Resize --
*+RButton::
{
  WinGetPos, wgx, wgy, fw, fh, Click2ID Measure
  MouseGetPos, ddx, ddy
  dfx := fw - ddx
  dfy := fh - ddy
  Loop
  {
    MouseGetPos, hhx, hhy, ht
    ww := dfx + hhx
    hh := dfy + hhy
    Gui, 11:Show, x%wgx% y%wgy% w%ww% h%hh%, Click2ID Measure
    If Not GetKeyState("RButton", "P")
    {
      Break
    }
    If Not GetKeyState("Shift", "P")
    {
      ExitApp
    }
  }
}
Loop,
{
  If GetKeyState("LButton", "P")
  {
    Exit
  }
     If Not GetKeyState("Shift", "P")
  {
    ExitApp
  }
}
Return

Tool:
Return

Func1()
{
  Gui, 11:Show, % "x"(dx) "y"(dy) "w"(hx - dx) "h"(hy - dy), Click2ID Measure
}
Func2()
{
  Gui, 11:Show, % "x"(dx) "y"(hy) "w"(hx - dx) "h"(dy - hy), Click2ID Measure
}
Func3()
{
  Gui, 11:Show, % "x"(hx) "y"(dy) "w"(dx - hx) "h"(hy - dy), Click2ID Measure
}
Func4()
{
  Gui, 11:Show, % "x"(hx) "y"(hy) "w"(dx - hx) "h"(dy - hy), Click2ID Measure
}

