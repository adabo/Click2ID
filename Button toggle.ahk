Gui, Add, Text, x15 y6 0x40201 w120 h120 gSwitcher , 1  ; Button Up
Gui, Add, Text, x6 y6 0x41201 w120 h120 gSwitcher Hidden, 2  ; Button down
Gui, Show, w140 h140
Switch := 0
Return

Switcher:
If  (Switch = 0)
{
  Control, Show,, Static2
  Control, Hide,, Static1
  Switch++
  Return
}
Else 
{
  Control, Hide,, Static2
  Control, Show,, Static1
  Switch--
  Return
}
Return

GuiClose:
ExitApp