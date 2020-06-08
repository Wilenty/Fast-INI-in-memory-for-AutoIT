#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

; It may works a bit slower than the Advanced_example.au3
; but, if you don't fill enough advanced, please use functions without the _IniInternal*,
; other way you can use them.
; They are a bit slower than "Advanced_example.au3", but still much faster than internal AutoIT INI functions.

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

$INI_sections_names = _IniEnumSections($INI_memory)
If @error == 0 Then
	For $w = 0 To UBound($INI_sections_names)-1
		ConsoleWrite("+[" & $INI_sections_names[$w] & "]" & @CRLF)
		Local $INI_section_keys_names = _IniEnumSectionKeys( $INI_memory, $INI_sections_names[$w] )
		; skip empty section
		If @error == 0 Then
			For $x = 0 To UBound($INI_section_keys_names)-1
				ConsoleWrite($INI_section_keys_names[$x] & ": '" & _IniClearKeyOrValue( _IniGetValue($INI_memory, $INI_sections_names[$w], $INI_section_keys_names[$x], ";-(") ) & "'" & @CRLF)
			Next
		EndIf
	Next
EndIf

$err = @error

ConsoleWrite( @CRLF & 'Timers: ' & TimerDiff($timer) & ' milliseconds, ' & Round(TimerDiff($timer)/1000, 3) & ' seconds' & @CRLF & @CRLF )

Exit $err