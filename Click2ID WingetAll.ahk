Ctrl::
MouseGetPos,,, WinID
WinGetTitle, WinTtl, AHK_ID %WinID%
Loop, 10
{
  If (A_Index = 1)
  {
    Cmd := "ID"
  }
  If (A_Index = 2)
  {
    Cmd := "IDLast"
  }
  If (A_Index = 3)
  {
    Cmd := "PID"
  }
  If (A_Index = 4)
  {
    Cmd := "ProcessName"
  }
  If (A_Index = 5)
  {
    Cmd := "Count"
  }
  If (A_Index = 6)
  {
    Cmd := "List"
  }
  If (A_Index = 7)
  {
    Cmd := "MinMax"
  }
  If (A_Index = 8)
  {
    Cmd := "Transparent"
  }
  If (A_Index = 9)
  {
    Cmd := "TransColor"
  }
  If (A_Index = 10)
  {
    Cmd := "Style"
  }
  Index := A_Index
  Loop, 1
  {
    WinGet, var%Index% , %Cmd%, AHK_ID %WinID%
  }
}

If (var7 = "-1")
{
  WinState := "Minimized"
}
If (var7= "1")
{
  WinState := "Maximized"
}
If (var7 = "0")
{
  WinState := "Not minimized/maximized"
}
MsgBox, % WinTtl . "`n-------------------`n" . "1. " . var1 . "`n" . "2. " . var2 . "`n" . "3. " . var3 . "`n" . "4. " .  var4 . "`n" . "5. " . var5 . "`n" . "6. " . var6 . "`n" . "7. " . WinState . "`n" . "8. " . var8 . "`n" . "9. " . var9 . "`n" . "10. " . var10
Return