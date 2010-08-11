CoordMode, Mouse, Screen
MouseGetPos, xx, yy, WinID
PixelGetColor, var11, %xx%, %yy%, RGB
WinGetTitle, WinTtl, AHK_ID %WinID%
WinGetPos, wpxx, wpyy, wpww, wphh, AHK_ID %WinID%
MsgBox, % var11

Session:
{
  Sess := 0
  Sess++
}

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
  Index := 1
  Index++
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
;Return

Gui, Add, Tab, x6 y7 w460 h270 , Window|Control
Gui, Add, GroupBox, x16 y37 w220 h230 , Names and I.D.'s
Gui, Add, GroupBox, x246 y37 w210 h230 , Sytles and colors
Gui, Add, ListView, x476 y27 w180 h250 , Title|Session|Date
Gui, Add, GroupBox, x416 y47 w30 h30, 
Gui, Add, Button, x36 y57 w60 h20 gCB1, Title
Gui, Add, Button, x36 y87 w60 h20 gCB2, I.D.
Gui, Add, Button, x36 y117 w60 h20 gCB3, Last
Gui, Add, Button, x36 y147 w60 h20 gCB4, P.I.D.
Gui, Add, Button, x36 y177 w60 h20 gCB5, P.Name
Gui, Add, Button, x36 y207 w60 h20 gCB6, Count
Gui, Add, Button, x36 y237 w60 h20 gCB7, List
Gui, Add, Button, x256 y57 w60 h20 gCB8, Min/Max
Gui, Add, Button, x256 y87 w60 h20 gCB9, Transp.
Gui, Add, Button, x256 y117 w60 h20 gCB10, T.Color
Gui, Add, Button, x256 y147 w60 h20 gCB11, Style/Ex
Gui, Add, Button, x256 y177 w60 h20 gCB12, Color.
Gui, Add, Button, x256 y207 w60 h20 gCB13, X-pos.
Gui, Add, Button, x256 y237 w60 h20 gCB14, Y-pos
Gui, Add, Edit, x106 y57 w120 h20 vEd1, %WinTtl%     ; Window title
Gui, Add, Edit, x106 y87 w90 h20 vEd2, %var1%        ; Window I.D.
Gui, Add, Edit, x106 y117 w90 h20 vEd3, %var2%       ; Last I.D. 
Gui, Add, Edit, x106 y147 w90 h20 vEd4, %var3%       ; P.I.D.
Gui, Add, Edit, x106 y177 w90 h20 vEd5, %var4%       : Process Name
Gui, Add, Edit, x106 y207 w90 h20 vEd6, %var5%       ; Count
Gui, Add, Edit, x106 y237 w90 h20 vEd7, %var6%       ; List
Gui, Add, Edit, x326 y57 w50 h20 vEd8, %var7%        ; Min/Max
Gui, Add, Edit, x326 y87 w50 h20 vEd9, %var8%        ; Transparency
Gui, Add, Edit, x326 y117 w50 h20 vEd10, %var9%      ; Transparency color
Gui, Add, Edit, x326 y147 w50 h20 vEd12, %var10%     ; Style/ExStyle
Gui, Add, Edit, x326 y177 w50 h20 vEd11, %var11%     ; Color
Gui, Add, Edit, x326 y207 w50 h20 vEd13, %wpxx%      ; X-pos
Gui, Add, Edit, x326 y237 w50 h20 vEd14, %wpyy%      ; Y-os
Gui, Add, Text, x476 y7 w180 h20 +Center, Copied history
Gui, Tab, Control
;Gui, Add, GroupBox, x16 y37 w440 h230 , Names and I.D.'s
; Generated using SmartGUI Creator 4.0
Gui, Show, x595 y348 h284 w664, Captured data

LV_Add("Col1", Sess, , A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)

Return

CB1:
{
  ControlGetText, txx, Edit1, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB2:
{
  ControlGetText, txx, Edit2, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB3:
{
  ControlGetText, txx, Edit3, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB4:
{
  ControlGetText, txx, Edit4, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB5:
{
  ControlGetText, txx, Edit5, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB6:
{
  ControlGetText, txx, Edit6, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB7:
{
  ControlGetText, txx, Edit7, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB8:
{
  ControlGetText, txx, Edit8, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB9:
{
  ControlGetText, txx, Edit9, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB10:
{
  ControlGetText, txx, Edit10, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB11:
{
  ControlGetText, txx, Edit11, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB12:
{
  ControlGetText, txx, Edit12, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB13:
{
  ControlGetText, txx, Edit13, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

CB14:
{
  ControlGetText, txx, Edit14, Captured data
  LV_Add("Col1", txx, "*", A_MMM . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
}
Return

GuiClose:
ExitApp