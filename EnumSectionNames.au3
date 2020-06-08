#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

; Here you can check how fast the function is

$timer = TimerInit()

#include "_INI_memory.a3x"

If $CmdLine[0] == 0 Then
	ConsoleWrite('It needs one parameter: "full path to the 1st.ini"' & @CRLF)
	Exit -1
EndIf
If Not FileExists( $CmdLine[1] ) Then
	ConsoleWrite('File: "' & $CmdLine[1] & '" does not exists' & @CRLF)
	Exit 1
EndIf

$INI_memory = _IniLoadToMemory($CmdLine[1])
if @error Then
	ConsoleWrite("Can't load the file: " & $CmdLine[1] & @CRLF)
	Exit @error
EndIf

$INI_file_memory = _IniGetMemory($INI_memory)

$INI_sections_names = _IniInternalEnumSections( $INI_file_memory )
$err = @error

$ParseTimer = TimerDiff($timer)
$timer = TimerInit()

If $err == 0 Then
	For $w = 0 To UBound($INI_sections_names)-1
		ConsoleWrite("+[" & $INI_sections_names[$w] & "]" & @CRLF)
	Next
EndIf
$err = @error

$DisplayTimer = TimerDiff($timer)

ConsoleWrite( @CRLF & 'Timers:' & @CRLF )
ConsoleWrite( ' Parse time: ' & $ParseTimer & ' milliseconds, ' & Round($ParseTimer/1000, 3) & ' seconds' & @CRLF )
ConsoleWrite( ' Display time: ' & $DisplayTimer & ' milliseconds, ' & Round($DisplayTimer/1000, 3) & ' seconds' & @CRLF )

ConsoleWrite( @CRLF & 'Summary:' & @CRLF )
ConsoleWrite( ' Numer of sections: ' & UBound($INI_sections_names) & @CRLF )
ConsoleWrite( ' Numer of chars: ' & StringLen($INI_file_memory) & @CRLF )
ConsoleWrite( 'Total time: ' & $DisplayTimer+$ParseTimer & ' milliseconds, ' & Round( ($DisplayTimer+$ParseTimer)/1000, 3) & ' seconds' & @CRLF )
ConsoleWrite( @CRLF )

Exit $err
