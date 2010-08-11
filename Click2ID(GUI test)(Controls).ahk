Gui, Add, Tab, x6 y27 w460 h270 , Window|Control
Gui, Tab, Control
Gui, Add, GroupBox, x16 y57 w220 h230 , Names and I.D.'s
Gui, Add, GroupBox, x246 y57 w210 h230 , Location and sytles
Gui, Add, Button, x36 y77 w60 h20 vEdit3 gCB1, Title
Gui, Add, Button, x36 y107 w60 h20 vEdit4 gCB1, I.D.
Gui, Add, Button, x36 y137 w60 h20 vEdit5 gCB1, Last
Gui, Add, Button, x36 y167 w60 h20 vEdit6 gCB1, P.I.D.
Gui, Add, Button, x36 y197 w60 h20 vEdit7 gCB1, P.Name
Gui, Add, Button, x36 y227 w60 h20 vEdit8 gCB1, Count
Gui, Add, Button, x36 y257 w60 h20 vEdit9 gCB1, List
Gui, Add, Button, x256 y77 w60 h20 vEdit10 gCB1, Min/Max
Gui, Add, Button, x256 y107 w60 h20 vEdit11 gCB1, Transp.
Gui, Add, Button, x256 y137 w60 h20 vEdit12 gCB1, T.Color
Gui, Add, Button, x256 y167 w60 h20 vEdit13 gCB1, Style/Ex
Gui, Add, Button, x256 y197 w60 h20 vEdit14 gCB1, Color
Gui, Add, Button, x256 y227 w40 h20 vEdit15 gCB1, X-pos
Gui, Add, Button, x256 y257 w40 h20 vEdit16 gCB1, Y-pos
Gui, Add, Edit, x106 y77 w120 h20 +ReadOnly vEd1, %WinTtl%
Gui, Add, Edit, x106 y107 w90 h20 +ReadOnly vEd3, %var1%
Gui, Add, Edit, x106 y137 w90 h20 +ReadOnly vEd4, %var2%
Gui, Add, Edit, x106 y167 w90 h20 +ReadOnly vEd5, %var3%
Gui, Add, Edit, x106 y197 w90 h20 +ReadOnly vEd6, %var4%
Gui, Add, Edit, x106 y227 w90 h20 +ReadOnly vEd7, %var5%
Gui, Add, Edit, x106 y257 w90 h20 +ReadOnly vEd8, %var6%
Gui, Add, Edit, x326 y77 w120 h20 +ReadOnly vEd9, %WinState%
Gui, Add, Edit, x326 y107 w62 h20 +ReadOnly vEd10, %var8%
Gui, Add, Edit, x326 y137 w62 h20 +ReadOnly vEd11, %var9%
Gui, Add, Edit, x326 y167 w62 h20 +ReadOnly vEd12, %var10%
Gui, Add, Edit, x326 y197 w62 h20 +ReadOnly vEd13, %var11%
Gui, Add, Edit, x306 y227 w40 h20 +ReadOnly vEd14, %wpxx%
Gui, Add, Edit, x306 y257 w40 h20 +ReadOnly vEd15, %wpyy%
Gui, Add, Edit, x406 y227 w40 h20 +ReadOnly, %wpww%
Gui, Add, Edit, x406 y257 w40 h20 +ReadOnly, %wphh%
Gui, Add, Button, x356 y227 w40 h20 vEdit17 gCB1, Width
Gui, Add, Button, x356 y257 w40 h20 vEdit18 gCB1, Hght.
Gui, Add, Edit, x390 y194 w62 h28 -VScroll ; Color box, 
Gui, Add, Button, x36 y77 w60 h20 vEditx gCB1, Title
; Generated using SmartGUI Creator 4.0
Gui, Show, x55 y647 h420 w803, New GUI Window
Return

GuiClose:
ExitApp