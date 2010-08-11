#SingleInstance Force
MsgBox, 64, Crosshairs start, Hold the 'Ctrl' key and click the 'LButton'. Release 'Ctrl' to exit.
CoordMode, Mouse, Screen
Gui, 1:+ToolWiindow -Border -Caption +AlwaysOntop
Gui, 1:Color, 0xFF00FF
Gui, 1:Show, w%A_ScreenWidth% h1, CrossHairs1
Gui, 2:+ToolWiindow -Border -Caption +AlwaysOntop
Gui, 2:Color, 0xFF00FF
Gui, 2:Show, w1 h%A_ScreenHeight%, CrossHairs2

^LButton::
Loop,
{
  MouseGetPos, xx, yy
  Gui, 1:-AlwaysOnTop
  Gui, 1:Show, % "y"yy
  Gui, 2:-AlwaysOnTop
  Gui, 2:Show,% "x"xx
  If Not GetKeyState("Ctrl", "P")
  {
    Break
  }
}
Gui, 1:Destroy
Gui, 2:Destroy
ExitApp