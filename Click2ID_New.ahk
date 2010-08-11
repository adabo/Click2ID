Func(x,y,z)
{
  Return x / y - z
}
MsgBox, 1,,WARNING:`nThis program erases your clipboard's contents.`n`nPress OK to continue or Cancel to quit.
IfMsgBox, Cancel
{
  ExitApp
}
GoSub, Init
Unhide:
{
  CoordMode, ToolTip, Screen
  ClipBoard :=
  Nm := 22
  Begin:
  {
    Gui, 2:Destroy
    Gui, 3:Destroy
    Gui, 1:+LastFound
    Gui, 1:Font, s8, Tahoma
    Gui, 1:Add, Text,, Click "Ok" to start viewing information.
    Gui, 1:Add, Button, yp+22 w80 gWatch, Ok  ; 
    Gui, 1:Show,, Click2ID
    GoSub, Stuff

    Stuff:
    WinGetPos,,, winw,, Click2ID
    controlgetpos,,, btnw,, Button1, Click2ID
    centerx:=winw/2-btnw/2
    controlmove, Button1, %centerx%,,,,Click2ID
return
  }
  Return
}
Return

Watch:
{
  CopyAll := "Copy all"
  If Not GetKeyState("LButton", "P")
  Loop,
  {
    Gui, Destroy
    MouseGetPos,xx,yy, UniqueID, ClassNN
    MouseGetPos,,,, CHWnd, 2
    WinGetTitle, WTitle, AHK_ID %UniqueID%
    WinGetClass, WTClass, AHK_ID %UniqueID%
    PixelGetColor, cColor, %xx%, %yy%, RGB
    Gui, 4: -Caption -SysMenu -MaximizeBox -Minimizebox
    Gui, 4:+Border
    Gui, 4:Show, % "x"A_ScreenWidth / 2 . "y"A_ScreenHeight / 2 -50 . "w40" . "h40", Pixel Color
    Gui, 4:Color, %cColor%
    ToolTip, % "Window's title is: " . WTitle . "`nWindow's class is: " . WTClass .  "UniqueID is: " . UniqueID . "`nControl's class is: " . ClassNN . "`nControl's HWnd is: " . CHWnd . "`nPixel's color is:" . cColor . "`n`n(Click left mouse button anywhere.)`n" . "x & y coord." . xx . ", " . yy, % A_ScreenWidth / 2, % A_ScreenHeight / 2 + 30
    If GetKeyState("LButton", "P")
    {
      Break
    }
    IfInString, WTitle, UniqueID
    {
      Loop
      {
        If GetKeyState("LButton", "P")
        {
          Break
        }
        MouseGetPos,xx,yy, UniqueID, ClassNN
        WinGetTitle, WTitle, AHK_Id %UniqueID%
        IfNotInString, WTitle, UniqueID
        {
          Break
        }
        Sleep, 1
      }
    }
    MouseGetPos,xx,yy, UniqueID, ClassNN
    PixelGetColor, cColor2, %xx%, %yy%, Slow|RGB
    If (cColor == cColor2)
    {
      Loop
      {
        If GetKeyState("LButton", "P")
        {
          Break
        }
        MouseGetPos,xx,yy, UniqueID, ClassNN
        PixelGetColor, cColor2, %xx%, %yy%, Slow|RGB
        If (cColor != cColor2)
        {
          Break
        }
        Sleep, 1
      }
    }
    Sleep, 1
  }  
  GoSub, ClipInfo
}
Return

ClipInfo:
{
  ToolTip,
  Gui, 4:Destroy
  Gui, 2:Destroy
  Gui, 2:Font, s8, Tahoma
  Gui, 2:Add, GroupBox, w560 h165, Window and control's data
  Gui, 2:Add, Text, ym+20 xm+10,  Unique Id:
  Gui, 2:Add, Text, yp+28, ClassNN:
  Gui, 2:Add, Text, yp+28, Control HWnd:
  Gui, 2:Add, Text, yp+28, Window title:
  Gui, 2:Add, Text, yp+28, Color:
  Gui, 2:Add, Edit, ym+18 xp+80 w300 vEd1, %UniqueID%
  Gui, 2:Add, Edit, yp+28 w300 vEd2, %ClassNN%
  Gui, 2:Add, Edit, yp+28 w300 vEd3, %CHWnd%
  Gui, 2:Add, Edit, yp+28 w300 vEd4, %WTitle%
  Gui, 2:Add, Edit, c%cColor% yp+28 w300 vEd5, %cColor%
  Gui, 2:Add, Button, ym+20 xp+308 w60 gCb1, %Copy1%
  Gui, 2:Add, Button, yp+28 w60 gCb2, %Copy2%
  Gui, 2:Add, Button, yp+28 w60 gCb3, %Copy3%
  Gui, 2:Add, Button, yp+28 w60 gCb4, %Copy4%
  Gui, 2:Add, Button, yp+28 w60 gCb5, %Copy5%
  Gui, 2:Add, Button, ym+48 xp+68 w80 gCb6, %CopyAll%
  Gui, 2:Add, Button, yp+28 w80 gClearCb, Clear ClipB.
  Gui, 2:Add, Button, yp+28 w80 gg_Refresh, Refresh G.U.I.
  Gui, 2:Add, Button, yp+70 x200 w80 gWatch, Recapture
  Gui, 2:Show,, Captured data
  GoSub, Stuff2
  GoSub, ClipView
  
    Stuff2:
    WinGetPos,,, winw,, Captured data
    controlgetpos,,, btnw,, Button10, Captured data
    controlgetpos,,,, winh, Button7, Captured data
    centery := winh / 2 - btnh /2
    centerx:=winw/2-btnw/2
    controlmove, Button10, %centerx%,,,,Captured data
    controlmove, Button7,, %centery%,,,Captured data
    Return
    
  GoSub, ClipView
  Return
  Cb1:
  {
    Gui, 2:Submit, NoHide
    Clipboard := Ed1
    ClipSave .= "UniqeId: " . Ed1 . "`n"
    IfNotInString, Copy1, * 
    {
      Copy1 := "* Copy *"
    }
    Gui, 3:Destroy
    Nm += 12
    GoSub, ClipView2
  }
  Return
  Cb2:
  {
    Gui, 2:Submit, NoHide
    Clipboard := Ed2
    ClipSave .= "ClassNN: " . Ed2 . "`n"
    IfNotInString, Copy2, * 
    {
      Copy2 := "* Copy *"
    }
    Gui, 3:Destroy
    Nm += 12
    GoSub, ClipView2
  }
  Return
  Cb3:
  {
    Gui, 2:Submit, NoHide
    Clipboard := Ed3
    ClipSave .= "Control HWnd: " . Ed3 . "`n"
    IfNotInString, Copy3, * 
    {
      Copy3 :="* Copy *"
    }
    Nm += 12
    GoSub, ClipView2
  }
  Return
  Cb4:
  {
    Gui, 2:Submit, NoHide
    Clipboard := Ed4
    ClipSave .= "Window title: " . Ed4 . "`n"
    IfNotInString, Copy4, * 
    {
      Copy4 :="* Copy *"
    }
    Gui, 3:Destroy
    Nm += 12
    GoSub, ClipView2
  }
  Return
  Cb5:
  {
    Gui, 2:Submit, NoHide
    Clipboard := Ed5
    ClipSave .= "Pixel color: " . Ed5 . "`n"
    IfNotInString, Copy5, * 
    {
      Copy5 :="* Copy *"
    }
    Gui, 3:Destroy
    Nm += 12
    GoSub, ClipView2
  }
  Return
  Cb6:
  {
    Gui, 2:Submit, NoHide
    Clipboard := Ed1 . "`n" . Ed2 . "`n" . Ed3 . "`n" . Ed4 . "`n" . Ed5 . "`n" . Ed6
    ClipSave .= "UniqeId: " . Ed1 . "`n" . "ClassNN: " . Ed2 . "`n"  . "Control HWnd: " . Ed3 . "`n". "Window title: " . Ed4 . "`n" . "Pixel color: " . Ed5 . "`n"
    IfNotInString, CopyAll, * 
    {
      Copyall :="* Copy all *"
    }
    Gui, 3:Destroy
    Nm += 60
    GoSub, ClipView2
  }
  Return
  ClipView:
  {
    Gui, 3:+Owner2
    Gui, 3:-SysMenu -MaximizeBox -Minimizebox
    Gui, 3:Add, Edit, w300 h%Nm%, %ClipSave%
    Gui, 3:Show, % "y"0 . "x" . A_ScreenWidth - 312, Clipboard history
  }
  Return
  ClipView2:
  {
    Gui, 3:Default
    ControlSetText,, Edit1, Clipboard history
    /*
    Gui, 3:+Owner2
    Gui, 3:-SysMenu -MaximizeBox -Minimizebox
    Gui, 3:Add, Edit, w300 h%Nm%, %ClipSave%
    Gui, 3:Show, % "y"0 . "x" . A_ScreenWidth - 312, Clipboard history
    */
    GoSub, ClipInfo
  }
  Return
  ClearCb:
  {
    GoSub, Init
    Gui, 2:Add, Edit, ym+18 xp+80 w300, %UniqueID%
    Gui, 2:Add, Edit, yp+28 w300, %ClassNN%
    Gui, 2:Add, Edit, yp+28 w300, %CHWnd%
    Gui, 2:Add, Edit, yp+28 w300, %WTitle%
    Gui, 2:Add, Edit, c%cColor% yp+28 w300, %cColor%
    Clipboard :=
    ClipSave :=
    Nm := 22
    Gui, 3:Destroy
    Gui, 3:-SysMenu -Caption
    Gui, 3:Add, Edit, w300 h%Nm%, %ClipSave%
    Gui, 3:Show, % "y"0 . "x" . A_ScreenWidth - 312
    GoSub, ClipInfo
  }
  Return
  g_Refresh:
  {
    GoSub, Init
    Gui, 2:Destroy
    Gui, 2:Font, s8, Tahoma
    Gui, 2:Add, GroupBox, w560 h165, Window and control's data
    Gui, 2:Add, Text, ym+20 xm+10,  Unique Id:
    Gui, 2:Add, Text, yp+28, ClassNN:
    Gui, 2:Add, Text, yp+28, Control HWnd:
    Gui, 2:Add, Text, yp+28, Window title:
    Gui, 2:Add, Text, yp+28, Color:
    Gui, 2:Add, Edit, ym+18 xp+80 w300 vEd1
    Gui, 2:Add, Edit, yp+28 w300 vEd2
    Gui, 2:Add, Edit, yp+28 w300 vEd3
    Gui, 2:Add, Edit, yp+28 w300 vEd4
    Gui, 2:Add, Edit, c%cColor% yp+28 w300 vEd5
    Gui, 2:Add, Button, ym+20 xp+308 w60 gCb1, Copy
    Gui, 2:Add, Button, yp+28 w60 gCb2, Copy
    Gui, 2:Add, Button, yp+28 w60 gCb3, Copy
    Gui, 2:Add, Button, yp+28 w60 gCb4, Copy
    Gui, 2:Add, Button, yp+28 w60 gCb5, Copy
    Gui, 2:Add, Button, ym+48 xp+68 w80 gCb6, Copy All
    Gui, 2:Add, Button, yp+28 w80 gClearCb, Clear ClipB.
    Gui, 2:Add, Button, yp+28 w80 gg_Refresh, Refresh G.U.I.
    Gui, 2:Add, Button, yp+66 x200 w80 gWatch, Recapture
    Gui, 2:Show,, Captured data
    GoSub, Stuff2
    GoSub, ClipView
  }
  Return
}
Return  
GuiClose:
Gui, 1:Hide
Exit

2GuiClose:
Gui, 2:Hide
Gui, 3:Hide
Exit

Init:
Copy1 := "Copy"
Copy2 := "Copy"
Copy3 := "Copy"
Copy4 := "Copy"
Copy5 := "Copy"
CopyAll := "Copy all"
Return

#!c::GoSub, Unhide