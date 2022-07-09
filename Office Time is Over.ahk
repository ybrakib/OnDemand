#NoEnv
#Persistent
#NoTrayIcon
#SingleInstance, force
SetBatchLines, -1
SetWorkingDir %A_ScriptDir%
SendMode Input
CoordMode, Mouse, Screen
#Include <Neutron>
html =
( ; html
  <h1>WARNING</h1>

  <p>Your shift time is over. </br>The Office desktop will shut</br>Down in 10 mins</p>
  <h2>PLEASE GO HOME</h2>
)

css =
( ; css
  body {
    overflow: hidden;
    text-align: center;
  }
  header {
    background: #333;
    color: white;
  }

  .main {
    background: #444;
    color: white;
    font-size: 4em;
  }
  h1{
    color: red;
  }
  h2{
    color: green;
  }
)

js =
( ; js
  // Write some JavaScript here
)

title = % A_ScriptName
neutron := new NeutronWindow(html, css, js, title)
neutron.Gui("+LabelNeutron")
SetTimer Timer, 1000
Return

NeutronClose:
ExitApp
Return

MButton::
  if GetKeyState("ScrollLock", "T")
    WinMinimizeAll
Return

Timer:
  If (A_Hour=20 && A_Min=0){
    SysGet, Mon2, MonitorWorkArea
    AlertArea := % "w" . Mon2Right . " h" . Mon2Bottom
    neutron.Show(AlertArea)
    neutron.Maximize()
    SetTimer, shutIt, 600000
    SetTimer, Timer, Off
  }
Return

shutIt:
  SetTimer, shutIt, Off
  Shutdown, 5
Return

End::ExitApp