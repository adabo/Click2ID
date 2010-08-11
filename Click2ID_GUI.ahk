CoordMode, ToolTip, Screen
;SetTimer, ClipView, 1000
Begin:
Gui, 3:Destroy
ClipBoard :=
ClipSave :=
Nm := 22
Gui, Destroy
Gui, Add, Text, ym+4,  Line#1
Gui, Add, Text, yp+28, Line#2
Gui, Add, Text, yp+28, Line#3
Gui, Add, Text, yp+28, Line#4
Gui, Add, Edit, ym w300 vEd1, Edit#1
Gui, Add, Edit, yp+28 w300 vEd2, Edit#2
Gui, Add, Edit, yp+28 w300 vEd3, Edit#3
Gui, Add, Edit, yp+28 w300 vEd4, Edit#4
Gui, Add, Button, ym w40 gCb1, Copy
Gui, Add, Button, yp+28 w40 gCb2, Copy
Gui, Add, Button, yp+28 w40 gCb3, Copy
Gui, Add, Button, yp+28 w40 gCb4, Copy
Gui, Add, Button, yp+38 x185 gBegin, Restart
Gui, Show,  ; w500 h500
GoSub, ClipView
Return
Cb1:
{
  Gui, Submit, NoHide
  Clipboard := Ed1
  ClipSave .= "Line#1: " . Ed1 . "`n"
  ;MsgBox, %Ed1%
  Gui, 3:Destroy
  Nm += 12
  GoSub, ClipView
}
Return
Cb2:
{
  Gui, Submit, NoHide
  Clipboard := Ed2
  ClipSave .= "Line#2: " . Ed2 . "`n"
  ;MsgBox, %Ed2%
  Gui, 3:Destroy
  Nm += 12
  GoSub, ClipView
}
Return
Cb3:
{
  Gui, Submit, NoHide
  Clipboard := Ed3
  ClipSave .= "Line#3: " . Ed3 . "`n"
  ;MsgBox, %Ed3%
  Gui, 3:Destroy
  Nm += 12
  GoSub, ClipView
}
Return
Cb4:
{
  Gui, Submit, NoHide
  Clipboard := Ed4
  ClipSave .= "Line#4: " . Ed4 . "`n"
  ;MsgBox, %Ed4%
  Gui, 3:Destroy
  Nm += 12
  GoSub, ClipView
}
Return
ClipView:
{
  Gui, 3:-SysMenu -Caption
  Gui, 3:Add, Edit, w300 h%Nm%, %ClipSave%
  Gui, 3:Show, % "y"0 . "x" . A_ScreenWidth - 312
  ;ToolTip, %ClipBoard%, % A_ScreenWidth-100, 0
}
Return