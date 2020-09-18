#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; NOTE: Run this script as Administrator.

#SingleInstance Force
SendMode Input
SetTitleMatchMode 2
#WinActivateForce
DetectHiddenWindows On
SetControlDelay -1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1

; -Creates Application

Gui New, -MaximizeBox
Gui Add, Button, x40 y72 w50 h23, Start
Gui Add, Button, x155 y72 w50 h23, Reset
Gui Font, s14
Gui Add, Text, x20 y6 w192 h23 +0x200 Center, Grand Summoners
Gui Font
Gui Add, Text, x64 y36 w120 h23 +0x200 Center, Redeploy Script
Gui Show, x1560 y145 w234 h108, GS Farm Module
Return

; -The Actual Farming Process

ButtonStart:
;#IfWinActive BlueStacks
WinActivate, BlueStacks
Sleep, 333
WinWaitActive, BlueStacks
Sleep, 333

targetColor := 0x020303 ; Set this to a pixel that will only appear during the Endscreen.
refillStamina := 0x03040A ; Indicates that stamina needs to be refilled

Loop
{
PixelGetColor, color, 684, 1680, RGB ; Finds the current color of the pixel.
Sleep, 100

; Goes through the Endscreen.
; Checks to see if player is at the Endscreen.
if(color = targetColor)
{
; Continuously clicks to skip EndScreen.
Loop, 18
{
ControlClick, x460 y845, BlueStacks ; Next.
Sleep, 200
}

ControlClick, x270 y1585, BlueStacks ; Clicks "Redeploy".
Sleep, 500

ControlClick, x260 y1260, BlueStacks ; Accepts Confirmation.
}
else if(color = refillStamina) ; Refills stamina if it's too low
{
ControlClick, x770 y915, BlueStacks ; Uses full potion if player already has 1 types of potions.
ControlClick, x770 y817, BlueStacks ; Uses full potion if player already has 2 types of potions.
ControlClick, x770 y694, BlueStacks ; Uses full potion if player already has 3 types of potions.
ControlClick, x770 y594, BlueStacks ; Uses full potion if player already has 4 types of potions.
Sleep, 500

ControlClick, x465 y940, BlueStacks ; Clicks 
}
else ; Clicks "okay" constantly to get into the next screen.
{
ControlClick, x460 y845, BlueStacks ; Click "Okay".
Sleep, 1000
}
}
Return

ButtonReset:
Reload

ESC::Reload

Escape:
GuiClose:
ExitApp
