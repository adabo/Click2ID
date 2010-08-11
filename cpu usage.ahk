#SingleInstance
#Persistent
;#NoTrayIcon                ; Save space w/o icon/menu

SetBatchLines, -1
VarSetCapacity( IdleTicks, 2*4 )

SetTimer, UpdateCPU, 250
SetTimer, UpdateToolTip, 10

UpdateToolTip:
   ToolTip %load%`%
return

UpdateCPU:
   IdleTime0 = %IdleTime%
   Tick0 = %Tick%

   DllCall("kernel32.dll\GetSystemTimes", "uint",&IdleTicks, "uint",0, "uint",0)
   IdleTime := *(&IdleTicks)

   Loop 7
      IdleTime += *( &IdleTicks + A_Index ) << ( 8 * A_Index )

   Tick := A_TickCount
   load := (200 - 0.01*(IdleTime - IdleTime0)/(Tick - Tick0))/2

   SetFormat, Float, 0.0
   load +=0
return 