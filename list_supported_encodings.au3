#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

; This example shows supported character encodings

$timer = TimerInit()

#include "_INI_memory.a3x"

$INI_memory = _IniCreateInMemory()

ConsoleWrite(@CRLF & '	File encodings supported by the "_INI_memory.a3x"' & @CRLF & @CRLF)
ConsoleWrite('_IniSetEncoding:	_IniSetEncodingString:	(FileOpen encoding:)' & @CRLF)
Func WriteLine()
	For $w = 0 To 6
		ConsoleWrite("----------")
	Next
	ConsoleWrite(@CRLF)
EndFunc
WriteLine()
For $w = 0 To 3
	$INI_memory = _IniSetEncoding($INI_memory, $w)
	If @error Then ContinueLoop
	Local $encoding_string = _IniGetEncodingString($INI_memory)
	ConsoleWrite('	' & $w & '			' & $encoding_string & '			(' & @extended & ')' & @CRLF)
	WriteLine()
Next

$err = @error

ConsoleWrite( @CRLF & 'Timers: ' & TimerDiff($timer) & ' milliseconds, ' & Round(TimerDiff($timer)/1000, 3) & ' seconds' & @CRLF & @CRLF )

Exit $err