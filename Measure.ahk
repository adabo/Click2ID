;============
;
;Shift + LButton + drag to make your box in all directions
;Shift + Control + LButton + Drag to move the window(Not necessary to click on the GUI to move it)
;Shift + RButton + Drag to resize the GUI in from ">v"(Drag right and down).
;
;============

#SingleInstance Force

MsgBox, 64, Controls for Measure, Controls:`n`nWhen you are ready, press and hold 'Shift'. Continue holding while using the folowing 'HotKeys':`n`nLButton:: drag the mouse in any direction to draw a box`nCtrl + LButton:: Move the created box.`nRButton:: Resize the box.`n`n*Note: 'Shift' is a toggle. Press + hold starts the tool, and release to exit.

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
    setw := abs(x + hx)
    seth := abs(y + hy)
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
  WinGetPos, MoveX, MoveY, ffw, ffh, Click2ID Measure
  KeyWait, LButton, D
  MouseGetPos, mvdx, mvdy
  xx := mvdx - MoveX
  yy := mvdy - MoveY
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
  CoordMode, Mouse, Screen
  WinGetPos, ReszX, ReszY, ReszW, ReszH, Click2ID Measure
  MousMv_X := ReszX + ReszW
  MousMv_Y := ReszY + ReszH
  MouseMove, %MousMv_X%, %MousMv_Y%, 0
  MouseGetPos, ddx, ddy
  dfx := ReszW - ddx
  dfy := ReszH - ddy
  Loop
  {
    MouseGetPos, hhx, hhy, ht
    ww := dfx + hhx
    hh := dfy + hhy
    Gui, 11:Show, x%ReszX% y%ReszY% w%ww% h%hh%, Click2ID Measure
    If Not GetKeyState("RButton", "P")
    {
      Break
    }
  }
}
Return

*~Shift Up::
Gui, 11:Destroy
MsgBox, 64,New measurement, Your selected box measurement is:`nWidth: %setw%`nHeight: %seth%
ExitApp