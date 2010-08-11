SetWorkingDir %A_ScriptDir%
Sess := 0
Switch := 0
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

Session:
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Gui, 10:+AlwaysOnTop -SysMenu -Caption +Border
Gui, 10:Font, s8, Tahoma
Gui, 10:Add, Edit, +ReadOnly -VScroll +Right x0 y0 w74 h275,  ; Edit1
Gui, 10:Add, Edit, +ReadOnly -VScroll +HScroll x74 y0 w185 h310,  ; Edit2
Gui, 10:Add, Edit, x0 y252 w74 h60 -VScroll, 
Gui, 10:Show, x0 w260 h312 , Watcher
ControlSetText, Edit1, % "WinTitle`r`nI.D.`r`nClass`r`nWidth`r`nHeight`r`nX-pos`r`nY-pos`r`n________`r`nControl`r`nHwnd/ID`r`nClassNN`r`nWidth`r`nHeight`r`nX-pos`r`nY-pos`r`n________`r`nMouse-X`r`nMouse-Y`r`nColor", Watcher
Loop,
{
  MouseGetPos, xx, yy, WinID, CtrlCls
  PixelGetColor, var11, %xx%, %yy%, Alt RGB
  Gui, 10:Color,, % var11
  WinGetTitle, WinTtl, AHK_ID %WinID%
  WinGetClass, WinCls, AHK_ID %WinID%
  WinGetPos, wpxx, wpyy, wpww, wphh, AHK_ID %WinID%
  ControlGetText, CtrlTtll, %CtrlCls%, AHK_ID %WinID%
  StringReplace, CtrlTtl, CtrlTtll, `r`n , %A_Space%, All
  ControlGet, CtrlHwnd, Hwnd,, %CtrlCls%, AHK_ID %WinID%
  ControlGet, CtrlHwnd, Hwnd,, %CtrlCls%, AHK_ID %WinID%
  ControlGetPos , cxx, cyy, cww, chh,, AHK_ID %CtrlHwnd%
  ControlSetText, Edit2, % WinTtl "`r`n" WinID "`r`n" WinCls "`r`n" wpww "`r`n" wphh "`r`n" wpxx "`r`n" wpyy "`r`n____________________________`r`n" CtrlTtl "`r`n" CtrlHwnd "`r`n" CtrlCls "`r`n" cww "`r`n" chh "`r`n" cxx "`r`n" cyy "`r`n____________________________`r`n" xx "`r`n" yy "`r`n" var11, Watcher
  Loop,
  {
    MouseGetPos, xx2, yy2
    If  (xx2 != xx) || (yy2 != yy)
    {
      Break
    }
    If (WinTtl = "Watcher")
    {
      Loop,
      {
        MouseGetPos,,, WinID2,
        WinGetTitle, WinTtl2, AHK_ID %WinID2%
        If (WinTtl2 != "Watcher")
        {
          Break
        }
        If GetKeyState("LButton", "P")
        {
          SendInput, {LButton Down}
          Break
        }
      }
    }
    If GetKeyState("LButton", "P")
    {
      SendInput, {LButton Down}
      Break
    }
  }
  If GetKeyState("LButton", "P")
  {
    Break
  }
  Sleep, 45
}
SendInput, {LButton Up}
Gui, 10:Destroy
Sess++
CopyX += 1
Index := 1
IndexVar := 1
IndexEd := 4
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
    Cmd := "PID"z
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
  Loop, 1
  {
    WinGet, var%Index% , %Cmd%, AHK_ID %WinID%
  } 
  If (A_GuiControl > 0)
  {
    va := "var" . IndexVar
    StringReplace, vb, %va%, IndexVar, IndexEd
    Loop, 1
    {
      ControlSetText, Edit%IndexEd%, % vb, Captured data
      IndexVar++
      IndexEd += 1
    }
    If  (IndexVar = 10)
    {
      ;ControlSetText, Edit18, % var11, Captured data
      IndexEd++
      ControlSetText, Edit15, % wpxx, Captured data
      IndexEd++
      ControlSetText, Edit16, % wpyy, Captured data
      ControlSetText, Edit17, % wpww, Captured data
      ControlSetText, Edit18, % wphh, Captured data
      ControlSetText, Edit3, % WinTtl, Captured data
      Gui, Color,, %var11%
      Gui, Restore
      LV_Add("Col1", "-", "-", "-", Sess . "-Start", A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
      Return
    }
    ;Gui, Restore
  }
  Index += 1
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
GoSub, CapturedData
Return

CapturedData:
Gui, Font, s8, Tahoma
Gui, -Caption +Border
Gui, Add, Text, x3 y2 w680 h18 0x423505 gDrag,               ; Title bar(no actual title)
Gui, Add, Text, x755 y2 w16 h18 0x423505 gDrag,               ; Title bar(no actual title)
Gui, Add, Text, x476 y27 w160 h20 +ReadOnly +Right, Copied history
Gui, Add, Button, x646 y23 w60 h20 gSave, Save
Gui, Add, Button, x716 y23 w60 h20 gClear, Clear
Gui, Add, Text, x678 y2 w26 h17 0x40201 gMini,           ; __
Gui, Add, Text, x678 y2 w26 h17 0x41201 Hidden gMini,    ; __
Gui, Add, Text, x704 y2 w26 h17 0x40201 gMaxi,           ; []
Gui, Add, Text, x704 y2 w26 h17 0x41201 Hidden gMaxi,    ; []
Gui, Add, Text, x730 y2 w26 h17 0x40201 gClose,          ; X
Gui, Add, Text, x730 y2 w26 h17 0x41201 Hidden gClose,   ; X
Gui, Add, Text, x770 y2 w26 h17 gAbout 0x40201,          ; ?
Gui, Add, Text, x770 y2 w26 h17 gAbout Hidden 0x41201,   ; ?
Gui, Add, Picture, x738 y6 Hidden, c:\Users\Abel\Desktop\scripts\Click2ID\Text_Close.png
Gui, Add, Picture, x738 y6, c:\Users\Abel\Desktop\scripts\Click2ID\Text_Close.png
Gui, Add, Picture, x710 y4 Hidden, c:\Users\Abel\Desktop\scripts\Click2ID\Text_Maxi.png
Gui, Add, Picture, x710 y4, c:\Users\Abel\Desktop\scripts\Click2ID\Text_Maxi.png
Gui, Add, Picture, x684 y12 Hidden, c:\Users\Abel\Desktop\scripts\Click2ID\Text_Mini.png
Gui, Add, Picture, x684 y12, c:\Users\Abel\Desktop\scripts\Click2ID\Text_Mini.png
Gui, Add, Picture, x780 y6 Hidden, c:\Users\Abel\Desktop\scripts\Click2ID\Text_About.png
Gui, Add, Picture, x780 y6, c:\Users\Abel\Desktop\scripts\Click2ID\Text_About.png
Gui, Add, ListView, x476 y47 w310 h250 BackGround0xFFFFFF, Title|W/C|Value|Session|Date
Gui, Add, Text, x13 y329 w358 h84 gSwitcher,                   ; Fake switcher
Gui, Add, GroupBox, x6 y300 w385 h110 , .             View Switcher
Gui, Add, GroupBox, x6 y300 w385 h110 , .             View Switcher
Gui, Add, Edit, x13 y319 w373 h82 +ReadOnly -VScroll,          ; Infoview
Gui, Add, Edit, x13 y319 w373 h82 Hidden +ReadOnly +VScroll,   ; Clipview
Gui, Add, Text, x15 y300 w36 h14 0x40201 gSwitcher,            ; Info toggle button
Gui, Add, Text, x15 y300 w36 h14 0x41201 Hidden gSwitcher,     ; Clip toggle button
Gui, Add, Picture, x21 y302 gSwitcher, c:\Users\Abel\Desktop\scripts\Click2ID\Text_Info(trans).png
Gui, Add, Picture, x21 y302 Hidden gSwitcher, c:\Users\Abel\Desktop\scripts\Click2ID\Text_Clip(trans).png
Gui, Add, GroupBox, x402 y300 w384 h52 , Actions
Gui, Add, Button, x410 y315 w72 h25 +Default gRecapture, Recapture
Gui, Add, Button, x483 y315 w72 h25 gCopyAllH, Copy history
Gui, Add, Button, x556 y315 w72 h25 gCopyAllW, Copy all Win
Gui, Add, Button, x629 y315 w72 h25 , Copy all Ctrl
Gui, Add, Button, x702 y315 w72 h25 , Save Clipb.
Gui, Add, GroupBox, x403 y357 w384 h52 , Tools
Gui, Add, Button, x410 y372 w72 h25 gSetHK, Set HotK.
Gui, Add, Button, x483 y372 w72 h25 gCHairs, C. Hairs
Gui, Add, Button, x556 y372 w72 h25 gMeasure, Measure
Gui, Add, Button, x629 y372 w72 h25 gTasMgr, Task mgr.
Gui, Add, Text, x704 y369 w77 h36 0x41101, ; Clock
Gui, Add, Tab, x6 y27 w460 h270 , Window|Control
Gui, Add, GroupBox, x16 y57 w220 h230 , Names and I.D.'s
Gui, Add, GroupBox, x246 y57 w210 h230 , Location and sytles
Gui, Add, Button, x36 y77 w60 h20 vEdit3 gCB1, Title           ; Button17
Gui, Add, Button, x36 y107 w60 h20 vEdit4 gCB1, I.D.           ; Button18
Gui, Add, Button, x36 y137 w60 h20 vEdit5 gCB1, Last           ; Button19
Gui, Add, Button, x36 y167 w60 h20 vEdit6 gCB1, P.I.D.         ; Button20
Gui, Add, Button, x36 y197 w60 h20 vEdit7 gCB1, P.Name         ; Button21
Gui, Add, Button, x36 y227 w60 h20 vEdit8 gCB1, Count          ; Button22
Gui, Add, Button, x36 y257 w60 h20 vEdit9 gCB1, List           ; Button23
Gui, Add, Button, x200 y198 w30 h20 , Go                       ; Button24
Gui, Add, Button, x256 y77 w60 h20 vEdit10 gCB1, Min/Max       ; Button25
Gui, Add, Button, x256 y107 w60 h20 vEdit11 gCB1, Transp.      ; Button26
Gui, Add, Button, x256 y137 w60 h20 vEdit12 gCB1, T.Color      ; Button27
Gui, Add, Button, x256 y167 w60 h20 vEdit13 gCB1, Style/Ex     ; Button28
Gui, Add, Button, x256 y197 w60 h20 vEdit14 gCB1, Color        ; Button29
Gui, Add, Button, x256 y227 w40 h20 vEdit15 gCB1, X-pos        ; Button30
Gui, Add, Button, x256 y257 w40 h20 vEdit16 gCB1, Y-pos        ; Button31
Gui, Add, Edit, x106 y77 w120 h20 +ReadOnly vEd1, %WinTtl%     ; ed2 Window title
Gui, Add, Edit, x106 y107 w90 h20 +ReadOnly vEd3, %var1%       ; ed3 Window I.D.
Gui, Add, Edit, x106 y137 w90 h20 +ReadOnly vEd4, %var2%       ; Last I.D.
Gui, Add, Edit, x106 y167 w90 h20 +ReadOnly vEd5, %var3%       ; P.I.D.
Gui, Add, Edit, x106 y197 w90 h20 +ReadOnly vEd6, %var4%       : Process Name
Gui, Add, Edit, x106 y227 w90 h20 +ReadOnly vEd7, %var5%       ; Count
Gui, Add, Edit, x106 y257 w90 h20 +ReadOnly vEd8, %var6%       ; List
Gui, Add, Edit, x326 y77 w120 h20 +ReadOnly vEd9, %WinState%   ; Min/Max
Gui, Add, Edit, x326 y107 w62 h20 +ReadOnly vEd10, %var8%      ; Transparency
Gui, Add, Edit, x326 y137 w62 h20 +ReadOnly vEd11, %var9%      ; Transparency color
Gui, Add, Edit, x326 y167 w62 h20 +ReadOnly vEd12, %var10%     ; Style/ExStyle
Gui, Add, Edit, x326 y197 w62 h20 +ReadOnly vEd13, %var11%     ; ed13 Color
Gui, Add, Edit, x306 y227 w40 h20 +ReadOnly vEd14, %wpxx%      ; X-pos
Gui, Add, Edit, x306 y257 w40 h20 +ReadOnly vEd15, %wpyy%      ; Y-pos
Gui, Add, Edit, x406 y227 w40 h20 +ReadOnly, %wpww%           ; width
Gui, Add, Edit, x406 y257 w40 h20 +ReadOnly, %wphh%           ; Height
Gui, Add, Button, x356 y227 w40 h20 vEdit17 gCB1, Width
Gui, Add, Button, x356 y257 w40 h20 vEdit18 gCB1, Hght.
Gui, Add, Edit, x390 y194 w62 h28 -VScroll ; Color box, 
Gui, Tab, Control
Gui, Add, Button, x36 y77 w60 h20 vEditx gCB1, Title
Gui, Show, h416 w799, Captured data
ControlSetText, Edit2, % "`r`n`r`n                                                     -= Empty =-", Captured data
LV_Add("Col1", "-", "-", "-", Sess . "-Start", A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)

; Start information mouse

Loop,
{
  MouseGetPos,,,, CtlClass
  StringTrimLeft, SBNum, CtlClass, 6
  ToolTip, % "Main loop`n" . CtlClass . "`n Trim: " . SBNum
  ControlSetText, Static25, % A_DDD . ", " . A_MMM . ", " . A_DD . "`n" . A_Hour . ":" . A_Min . ":" . A_Sec, Captured data
  If (CtlClass = "Button" . SBNum)
  {
    Loop,
    {
    ControlSetText, Static25, % A_DDD . ", " . A_MMM . ", " . A_DD . "`n" . A_Hour . ":" . A_Min . ":" . A_Sec, Captured data
    If  (SBNum <= 5)
      {
        SctnNum := 1
      }
      If  (SBNum >= 6) && (SBNum <= 13)
      {
        SctnNum := 2
      }
      If  (SBNum >= 16) && (SBNum <= 32)
      {
        SctnNum := 3
      }
      MouseGetPos,,,, CtlClass
      ToolTip, % "INI loop`n" . CtlClass . "`n Trim: " . SBNum
      If  (CtlClass != "Button" . SBNum)
      {
        Break
      }
      IniRead, TtlInfo, %A_ScriptDir%\text.ini, Section %SctnNum%, Title %SBNum%
      If  (TtlInfo = "ERROR")
      {
        TtlInfo :=
      }
      ToolTip, :D
      ControlSetText, Edit1, %TtlInfo%, Captured data
      If GetKeyState("RButton", "P")
      {
        GoSub, Manual
      }
      Loop,
      {
        MouseGetPos,,,, CtlClass2
        ControlSetText, Static25, % A_DDD . ", " . A_MMM . ", " . A_DD . "`n" . A_Hour . ":" . A_Min . ":" . A_Sec, Captured data
        If  (CtlClass2 = "Button" . SBNum)
        {
          Continue
        }
        Else 
        {
          Break
        }
        Sleep, 6
      }
      If GetKeyState("LButton", "P")
      {
        Break
      }
      Sleep, 6
     }
     ControlSetText, Edit1, , Captured data
  }
  Sleep, 1
}


CB1:
{
  ToolTip
  Gui, Submit, NoHide
  EditNum := A_GuiControl
  StringTrimLeft, ButNum, A_GuiControl, 4  ; Edit# trimed NOT actually button#
  ;MsgBox, % "1`n" . ButNum
  If  (ButNum >= 3) && (ButNum <= 9)
  {
    ;MsgBox, % "2`nButNum >= 3`n`" . ButNum
    ButNum +=14
  }
  Else 
  {
    ;MsgBox, % "3`nButNum NOT >= 3`n`nButNum: " . ButNum
    ButNum +=15
    ;MsgBox, % "4`nButNum: " . ButNum
  }
  ButTitle := "Button" . ButNum
  ;MsgBox, % "5`n". ButTitle
  If (ButNum <= 33)
  {
    WorC := "W"
  }
  Else
  {
    ;MsgBox, D:
  }
  ControlGetText, LVTitle, %ButTitle%, Captured data
  ControlGetText, Val, %EditNum%, Captured data
  Clipboard := Val
  ControlSetText, Edit2, % Clipboard, Captured data
  If (Val = "")
  {
    Return
  }
  LV_Add("Col1", LVTitle, WorC, Val, Sess, A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
  LV_ModifyCol(1)
  LV_ModifyCol(3)
  CoordMode, Mouse, Relative
  MouseGetPos, mgpttxx, mpgpttyy,, ttCtrl
  ControlGetPos, cgpttxx, cgpttyy,,, % ttCtrl
  ToolTip, % Val, % cgpttxx + 74, % cgpttyy
  CopyX++
}
Return



Drag:
{
  CoordMode, Mouse, Relative
  MouseGetPos, rxx, ryy
  KeyWait, LButton, D
  If GetKeyState("LButton", "P")
  {
    CoordMode, Mouse, Screen
    Loop,
    {
      MouseGetPos, sxx, syy
      Gui, Show, % "x"sxx - rxx . "y"syy - ryy, Captured data
      If Not GetKeyState("LButton", "P")
      {
        Break
      }
      Sleep, 4
    }
  }
}
Return




CopyAllW:
{
  ControlSetText, Edit2,, Captured data
  Gui, +OwnDialogs
  CEd := 2
  Loop, 18
  {
    ControlGetText, CAWin, Edit%CEd%, Captured data
    If  (CAWin = "")
    {
      CEd++
      Continue
    }
    Clipboard .= CAWin . "`r`n"
    ControlSetText, Edit2, % Clipboard, Captured data
    CEd++
  }
  LV_Add("Col1", "Copy all windows", "-", "-", Sess, A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
  LV_ModifyCol(1)
  LV_ModifyCol(5)
  MsgBox, 64, Copy all windows, All values copied.
  CopyX++
}
Return


CopyAllH:
{
  Gui, +OwnDialogs
  Loop, %CopyX%
  {
    rr := A_Index - 1
    Loop,  5
    {
      LV_GetText(rt, rr, A_Index)
      rr1 .= rt . ";  "
    }
    rr1 .= "`n"
  }
  Clipboard := rr1  
  ControlSetText, Edit2, % Clipboard, Captured data
  LV_Add("Col1", "Copy all history", "-", "-", Sess, A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
  LV_ModifyCol(1)
  LV_ModifyCol(5)
  MsgBox, 64, Copy all history, All values copied.
  CopyX++
}
Return


Save:
{
  Gui, +OwnDialogs
  Loop, %CopyX%
  {
    rr := A_Index - 1
    Loop,  5
    {
      LV_GetText(rt, rr, A_Index)
      rr1 .= rt . ";  "
    }
    rr1 .= "`n"
  }
  MsgBox, 36, Save?, Would you like to save the history list to a file?
  IfMsgBox Yes
  {
    LV_Add("Col1", "Save", "-", "Saved", Sess, A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
    LV_ModifyCol(1)
    LV_ModifyCol(3)
    LV_ModifyCol(5)
    MsgBox, 64, Saved, Saved to "Click2ID history.txt"
    FileAppend, %rr1%, %A_ScriptDir%\Click2ID history.txt  
    CopyX++
  }
  Else 
  {
    LV_Add("Col1", "Save", "-", "Cancelled", Sess, A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
    LV_ModifyCol(1)
    LV_ModifyCol(3)
    LV_ModifyCol(5)
    MsgBox, 64, No, Save canceled
    CopyX++
    Return
  }
  ;Clipboard := rr1
  ;ControlSetText, Edit2, % Clipboard, Captured data
  rr1 :=
  rt :=
}
Return

Clear:
{
  Gui, +OwnDialogs
  SetTimer, ChangeButtonNames, 50 
  MsgBox, 35, Choose, What would you like to do?:`n`nClipboard: Clears the clipboard only.`nHistory: Clears the history list only.`nBoth: Clears both the clipboard and history's contents.
  IfMsgBox, Yes  ; Clipboard
  {
    MsgBox, 33, Clipboard, Are you sure you want to clear the contents of the clipboard?
    IfMsgBox, Cancel
    {
      Return
    }
    LV_Add("Col1", "Clear", "-", "Clipboard", Sess, A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
    LV_ModifyCol(1)
    LV_ModifyCol(3)
    LV_ModifyCol(5)
    CopyX++
    Clipboard :=
    ControlSetText, Edit2, % "`r`n`r`n                                                     -= Empty =-", Captured data
    MsgBox, 64, Clipboard, The clipboard cleared successfully.
    Return
  }
  IfMsgBox, No  ; History
  {
    MsgBox, 33, History, Are you sure you want to clear the contents of the history list?
    IfMsgBox, Cancel
    {
      Return
    }
    MBHist := 1
  }
  IfMsgBox, Cancel  ; Both
  {
    MsgBox, 33, Both, Are you sure you want to clear the contents of the clipboard and history list?
    IfMsgBox, Cancel
    {
      Return
    }
    MBHist := 0
  }
  Loop, % CopyX += 1
  {
    LV_Delete(CopyX)
    CopyX -= 1
    Sleep, 65
  }
  If (MBHist = 0)
  {
    Clipboard :=
    ControlSetText, Edit2, % "`r`n`r`n                                                     -= Empty =-", Captured data
    MsgBox, 64, Both, The history list and clipboard cleared successfully.
  }
  Else 
  {
    MsgBox, 64, History, The history list cleared succesfully.
  }
  }
  Return

  ChangeButtonNames: 
  {
    IfWinNotExist, Choose
    {
      Return
    }
    SetTimer, ChangeButtonNames, off 
    WinActivate 
    ControlSetText, Button1, &Clipboard
    ControlSetText, Button2, &History
    ControlSettext, Button3, &Both
    Return
  }
Return

Recapture:
{
  Gui, Show, Minimize, Captured data
  LV_Add("Col1", "Recapture", "-", "-", Sess, A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
  LV_ModifyCol(1)
  LV_ModifyCol(5)
  CopyX++
  GoSub, Session
}
Return

SetHK:
Gui, Show, Minimize
LV_Add("Col1", "SetHK", "-", "-", Sess, A_MMM . ", " . A_DDD . " ". A_Hour . ":" . A_Min . ":" . A_Sec)
LV_ModifyCol(1)
LV_ModifyCol(5)
CopyX++
Gui, +OwnDialogs
{
  CoordMode, Mouse, Screen
  SetBatchLines -1
  SetWinDelay -1
  SetControlDelay -1
  Loop,
  {
    Gui, 10:Destroy
    MouseGetPos,,, WinID1, CtrlID1
    WinGetPos, xx1, yy1, ww1, hh1, AHK_ID %WinID1%
    WinGetTitle, WinTtl, AHK_ID %WinID1%
    Gui, 10:Add, Edit, % "-VScroll" . " " . "x" . xx1 . " " . "y" . yy1 . " " .  "w" . ww1 . " " . "h" . hh1 
    Gui, 10:-Caption +ToolWindow
    Gui, 10:Color, 0x000000
    Gui, 10:+LastFound
    Winset, TransColor, 0xFFFFFF 220WX
    Gui, 10:Show, % "w" . A_ScreenWidth . "h" . A_ScreenHeight, guitrans
    Loop,
    {
      If GetKeyState("LButton", "P")
      {
        SendInput, {LButton Down}
        Break
      }
      MouseGetPos,,, WinID2
      If (WinID1 = WinID2)
      {
        Continue
      }
      Else 
      {
        Break
      }
    }
    If  GetKeyState("LButton", "P")
    {
      SendInput, {LButton Up}
      Break
    }
  }
  MouseGetPos, xx, yy, mgUID
  WinGet, v_pid, PID, AHK_ID %mgUID%
  WinGetTitle, wgTitle, AHK_ID %mgUID%
  ToolTip, % "WinTitle: " . wgTitle . "`n" .  "UniqueID: " . mgUID . "`n" . "PID: " . v_pid
  MsgBox, 262208,, You selected the window: "%wgtitle%" with a PID of: "%v_pid%"`n`nYou can use the hotkey '+^z' to activate/bring this window into focus at any time.`n`n*Note: You can choose another window to bind at a later time by clicking the 'SetHK' button again.
  Gui, 10:Destroy
  Gui, Restore
  Tooltip
  +^z::WinActivate, AHK_PID %v_pid%
}
Return

TasMgr:
{
  Send, {Ctrl Down}{Shift Down}{Esc Down}{Esc Up}{Shift Up}{Ctrl Up}
}
Return
  

Switcher:
{
  If  (Switch = 0)
  {
    Control, Show,, Edit2, Captured data
    Control, Hide,, Edit1, Captured data
    Control, Show,, Button4, Captured data
    Control, Hide,, Button3, Captured data
    Control, Hide,, Static21                    ; Info
    Control, Show,, Static22                    ; Clip
    Control, Hide,, Static23                    ; Info png
    Control, Show,, Static24                    ; Clip png    
    Switch := 1
  }
  Else
  {
    Control, Hide,, Edit2, Captured data
    Control, Show,, Edit1, Captured data
    Control, Hide,, Button4, Captured data
    Control, Show,, Button3, Captured data
    Control, Show,, Static21                    ; Info
    Control, Hide,, Static22                    ; Clip
    Control, Show,, Static23                    ; Info png
    Control, Hide,, Static24                    ; Clip png    
    Switch := 0
  }
}
Return

CHairs:
{
  Gui, Show, Minimize, Captured data
  Run, %A_ScriptDir%\Crosshairs.ahk
  WinWait, CrossHairs2
  WinWaitClose, CrossHairs2
  Gui, Restore
}
Return

Measure:
{
  Gui, Show, Minimize, Captured data
  Run, %A_ScriptDir%\Measure.ahk
  WinWait, New measurement
  WinWaitClose, New measurement
  Gui, Restore
}
Return

Manual:
{
  IniRead, TtlInfo, %A_ScriptDir%\text.ini, Section %SctnNum%, Title %SBNum%
  Gui, 3:Add, Text, w200 h300
  Gui, 3:Show,, Click2ID - Manual
  ControlSetText, Edit1, %TtlInfo%, Click2ID - Manual
  Return
}

About:
{
  Control, Hide,, Static10
  Control, Show,, Static11
  KeyWait, LButton, U
  Control, Show,, Static10
  Control, Hide,, Static11
  Em := "`nabel4@msn.com"
  AbText := "Click2ID, by adabo`nCreated on`nAugust 05, 2010`n`n----------------`n`nEnjoy!`nThanks to:`ntidbit`nJohnny`nxxxxx"
  Gui, 2:+Owner
  Gui, 2:-Caption +Border +AlwaysOnTop
  Gui, 2:Font,, Lucida Console
  Gui, 2:Add, GroupBox, w226 h155
  Gui, 2:Add, Text, xm+50 ym+12 gAbClose 0x1, %AbText%
  Gui, 2:Add, Text, cBlue xm+8 ym130 h18 gEml, %Em% 
  Gui, 2:Show
}
Return

AbClose:
{  
  Gui, 2:Destroy
}
Return

Eml:
{
  Run, mailto:abel4@msn.com
}
Return

Mini:
{
  Control, Hide,, Static4
  Control, Show,, Static5
  KeyWait, LButton, U
  Control, Show,, Static4
  Control, Hide,, Static5
  Gui, Hide
}
Return

Maxi:
{
  Control, Hide,, Static6
  Control, Show,, Static7
  KeyWait, LButton, U
  Control, Show,, Static6
  Control, Hide,, Static7
  Gui, Show, % "x"(A_ScreenWidth / 2) - 399 . "y"(A_ScreenHeight / 2) - 212 
}
Return

Close:
{
  Control, Hide,, Static8
  Control, Show,, Static9
  KeyWait, LButton, U
  Control, Show,, Static8
  Control, Hide,, Static9
  ExitApp
}
Return

#!c::Gui, Restore


GuiClose:
ExitApp
Pause::Pause