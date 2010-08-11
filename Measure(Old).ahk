;============
;
;Shift + LButton + drag to make your box in all directions
;Shift + Control + LButton + Drag to move the window(Not necessary to click on the GUI to move it)
;Shift + RButton + Drag to resize the GUI in from ">v"(Drag right and down).
;
;============

#SingleInstance Force

Gx := 1

;============
;   Draw
+LButton::
;
;============
{
  Gui, 11:Destroy
  CoordMode, Mouse, Screen
  KeyWait, LButton, D
  MouseGetPos, dx, dy, dt
  x := 0 - dx
  y := 0 - dy
  Gui, 11:Color, 0xFF00FF  ; % CC
  Gui, 11: +ToolWindow -Caption
  Gui, 11: +AlwaysOnTop
  Gui, 11: +Border
  Gui, 11:Show,, Click2ID Measure
  Loop
  {
    MouseGetPos, hx, hy, ht
    ToolTip, % "Width: " . x + hx . "`nHeight: " . y + hy
    If (dx < hx) and (dy < hy)
    {
      ; Right and down >v
      Gui, 11:Show, % "x"(dx) "y"(dy) "w"(hx - dx) "h"(hy - dy), Click2ID Measure
    }
    If(dx < hx) and (dy > hy)
    {
      ; Right and up >^
      Gui, 11:Show, % "x"(dx) "y"(hy) "w"(hx - dx) "h"(dy - hy), Click2ID Measure
    }
    If (dx > hx) and (dy < hy)
    {
      ; Left and down <v
      Gui, 11:Show, % "x"(hx) "y"(dy) "w"(dx - hx) "h"(hy - dy), Click2ID Measure
    }
    If (dx > hx) and (dy > hy)
    {
      ; Left and up <^
      Gui, 11:Show, % "x"(hx) "y"(hy) "w"(dx - hx) "h"(dy - hy), Click2ID Measure
    }
    WinSet, TransColor, 0xFFFFFF 120, Click2ID Measure  ; % CC
    If Not GetKeyState("LButton", "P")
    {
      setw := x + hx
      seth := y + hy
      Break
    }
    If Not GetKeyState("Shift", "P")
    {
      ExitApp
    }
  }
}
Return

;============
;   Move
*^LButton::
;
;============
{
  CoordMode, Mouse, Screen
  WinGetPos, ffx, ffy, ffw, ffh, Click2ID Measure
  KeyWait, LButton, D
  MouseGetPos, mvdx, mvdy
  xx := mvdx - ffx
  yy := mvdy - ffy
  Gui, 11:Show,, Click2ID Measure
  Loop
  {
    MouseGetPos, qx, qy
    Gui, 11:Show, % "x"(qx - xx) "y"(qy - yy), Click2ID Measure
    If not GetKeyState("lButton", "P")
    {
      Break
    }
  }
}
Return


;============
;   Resize
*RButton::
;
;============
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
  }
}
Return

*~Shift Up::
Gui, 11:Destroy
setw := x + hx
seth := y + hy
MsgBox, 64,New measurement, Your selected box measurement is:`nWidth: %setw%`nHeight: %seth%
ExitApp