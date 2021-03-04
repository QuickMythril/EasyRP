;-------------------------------------------------------------**SCRIPT WON'T WORK UNTIL YOU EDIT IT ACCORDING TO YOUR NEEDS!**------------------------------------------------
;-------------------------------------------------------------------**PLEASE READ THE INSTRUCTIONS PROVIDED CAREFULLY**-------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#NoTrayIcon  ;Used for removing script icon in the Taskbar System tray.
#Persistent  ;Used for persistent background running of script unless stated otherwise.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;-------------------------------------------------------------------------------**MAIN CODE STARTS HERE**---------------------------------------------------------------------

Time := A_NowUTC
EnvSub, Time, 19700101000000, Seconds  ;Creates a variable named "Time" and stores the current time when the script was run.

;Append or add/change path directory of whatever app you want to show the RP of below. Example, for Photoshop the code line below would be something like this: Run, C:\Program Files\Adobe\Adobe Photoshop 2021\Photoshop.exe
Run, <App Path>  ;Runs the specified application in the path directory.

;Give the .exe file name of the app you just put the directory of above. Example, for Photoshop the code line below would be something like this: WinWait, ahk_exe Photoshop.exe
;The Process name is basically the name of the .exe file that you run. You can always run the app and check it out in the 'Details' Tab in the 'Task Manager' window if you want.
WinWait, ahk_exe <.exe file name>  ;Script waits until the specified process starts running.


;Provide the same .exe name in the brackets.
if WinExist(ahk_exe <.exe file name>)  ;Checks if the specified window exists.
	{
		;Specify the ID of the App you created on discord.com/developers/applications/ here
		IniWrite, <Application ID>, <config.ini File Path>, Identifiers, ClientID
		
		IniWrite, <User Custom State>, <config.ini File Path>, State, State
		IniWrite, <User Custom Details>, <config.ini File Path>, State, Details
		IniWrite, %Time%, <config.ini File Path>, State, StartTimestamp
		IniWrite, "", <config.ini File Path>, State, EndTimestamp
		
		;Specify the name of the Large image that you want which you uploaded on discord.com/developers/applications/
		IniWrite, <User Custom State>, <config.ini File Path>, Images, LargeImage
		IniWrite, <User Custom Large image cursor hover text>, <config.ini File Path>, Images, LargeImageTooltip
		
		;Specify the name of the Small image that you want which you uploaded on discord.com/developers/applications/
		IniWrite, <User Custom State>, <config.ini File Path>, Images, SmallImage
		IniWrite, <User Custom Small image cursor hover text>, <config.ini File Path>, Images, SmallImageTooltip
		
		Run, <Put easyrp.exe file Path here>, ,Hide  ;Runs the easyrp.exe file in a hidden mode.
	}


WinWaitClose, ahk_exe <.exe file name>	;Script waits until your main Application closes.

WinShow, ahk_exe easyrp.exe  ;Specify the .exe filename of your easyrp.exe(which is the default filename)-Activates the hidden easyrp.exe file which was running in hidden mode.
WinClose, ahk_exe easyrp.exe  ;Specify the .exe filename of your easyrp.exe(which is the default filename)-Closes the easyrp.exe file as it is no longer needed to show the RP on discord.
	
WinWaitClose, ahk_exe easyrp.exe  ;Specify the .exe filename of your easyrp.exe(which is the default filename)-Script waits till the easyrp.exe file has closed.
	
ExitApp  ;Terminates the Script.

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;---------------------------------------------------------------**THE CODE WONT WORK WITHOUT INSTALLING AUTOHOTKEY (AHK)**----------------------------------------------------
