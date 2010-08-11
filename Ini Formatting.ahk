Loop,
{
  If  (TtlInfo == TtlInfo2)
  {
    MsgBox, :D
    Continue
  }
  Else 
  {
    MsgBox, D:  
  }
}

StringReplace, TempMessage, Message,`n,%A_Tab%, ReplaceAll
IniWrite, %TempMessage%, %inifile%, %Name%, Message

; here.. this is to save the contents of "Message" into an ini file
; converted from line feed to tab of course
; and at loading:
StringReplace, Message, TempMessage,%A_Tab%,`n, ReplaceAll ;swap tabs with linefeeds


