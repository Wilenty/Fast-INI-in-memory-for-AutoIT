#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

; This example saves all sections in separate files with the same encoding as the main ini

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
		$ini_section = _IniGetSection($INI_memory, $INI_sections_names[$w])
		; skip empty section
;		If UBound( _IniInternalEnumSectionKeys($ini_section) )-1 < 1 Then ContinueLoop
		ConsoleWrite("+[" & $INI_sections_names[$w] & "]" & @CRLF)
		Local $tmp_ini_memory = _IniCreateInMemory( _IniGetEncoding($INI_memory) )
		$tmp_ini_memory = _IniAddSection( $tmp_ini_memory, $ini_section )
		If StringInStr($INI_sections_names[$w], "*", 2) > 0 Then $INI_sections_names[$w] = StringReplace($INI_sections_names[$w], '*', ';-)', 0, 2)
		If StringInStr($INI_sections_names[$w], ":", 2) > 0 Then $INI_sections_names[$w] = StringReplace($INI_sections_names[$w], ':', ';-)', 0, 2)
		If StringInStr($INI_sections_names[$w], "/", 2) > 0 Then $INI_sections_names[$w] = StringReplace($INI_sections_names[$w], '/', ';-)', 0, 2)
		If StringInStr($INI_sections_names[$w], "\", 2) > 0 Then $INI_sections_names[$w] = StringReplace($INI_sections_names[$w], '\', ';-)', 0, 2)
		If StringInStr($INI_sections_names[$w], "?", 2) > 0 Then $INI_sections_names[$w] = StringReplace($INI_sections_names[$w], '?', ';-)', 0, 2)
		If StringInStr($INI_sections_names[$w], "<", 2) > 0 Then $INI_sections_names[$w] = StringReplace($INI_sections_names[$w], '<', ';-)', 0, 2)
		If StringInStr($INI_sections_names[$w], ">", 2) > 0 Then $INI_sections_names[$w] = StringReplace($INI_sections_names[$w], '>', ';-)', 0, 2)
		Local $tmp_new_file_name = StringMid($CmdLine[1], 1, StringInStr($CmdLine[1], ".", 2)-1) & "[" & $INI_sections_names[$w] & "].ini"
		ConsoleWrite("Writing File: " & $tmp_new_file_name & @CRLF)
		_IniMemorySaveToFile($tmp_ini_memory, $tmp_new_file_name)
		If @error Then ExitLoop
	Next
EndIf

$err = @error

ConsoleWrite( @CRLF & 'Timers: ' & TimerDiff($timer) & ' milliseconds, ' & Round(TimerDiff($timer)/1000, 3) & ' seconds' & @CRLF & @CRLF )

Exit $err
