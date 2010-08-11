SetHK:
{
  CoordMode, Mouse, Screen
  SetBatchLines -1
  SetWinDelay -1
  SetControlDelay -1
  Loop,
  {
    ;KeyWait, Ctrl, U
    ;KeyWait, Ctrl, D
    Gui, 10:Destroy
    MouseGetPos,,, WinID1, CtrlID1
    WinGetPos, xx1, yy1, ww1, hh1, AHK_ID %WinID1%
    WinGetTitle, WinTtl, AHK_ID %WinID1%
    Gui, 10:Add, Edit, % "-VScroll" . " " . "x" . xx1 . " " . "y" . yy1 . " " .  "w" . ww1 . " " . "h" . hh1 
    Gui, 10:-Caption +ToolWindow
    Gui, 10:Color, 0x000000
    Gui, 10:+LastFound
    Winset, TransColor, 0xFFFFFF 220
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
  ;If GetKeyState("LButton", "P")
  MsgBox, You selected window: %wgtitle%`nwith a PID of: %v_pid%
  Gui, 10:Destroy
  Tooltip
  +^z::
  WinActivate, AHK_PID %v_pid%
}
Return