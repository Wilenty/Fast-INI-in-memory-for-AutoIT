#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

; This example tests functions

$timer = TimerInit()

#include "_INI_memory.a3x"

ConsoleWrite( '+ Create empty INI in memory' & @CRLF)
ConsoleWrite( '-> $INI_memory = _IniCreateInMemory()' & @CRLF)
$INI_memory = _IniCreateInMemory()
$err = @error
ConsoleWrite( "$INI_memory: " &  @CRLF & _IniGetMemory($INI_memory) & @CRLF)

ConsoleWrite( '-> $INI_memory = _IniSetValue($INI_memory, "Wilenty''s_Section", "Wilenty''s_Key", "Wilenty''s_Value")' & @CRLF)
$INI_memory = _IniSetValue($INI_memory, "Wilenty's_Section", "Wilenty's_Key", "Wilenty's_Value")
$err = @error
ConsoleWrite( "$INI_memory: " & @CRLF & _IniGetMemory($INI_memory) & @CRLF)

ConsoleWrite( '+ Store "Wilenty''s_Section" for later use' & @CRLF)
ConsoleWrite( '-> $Ini_section = _IniGetSection($INI_memory, "Wilenty''s_Section")' & @CRLF & @CRLF)
$Ini_section = _IniGetSection($INI_memory, "Wilenty's_Section")
$err = @error

ConsoleWrite( '-> $INI_memory = _IniSetValue($INI_memory, "Wilenty''s_Section", "Wilenty''s_Key", "value_of_Wilenty")' & @CRLF)
$INI_memory = _IniSetValue($INI_memory, "Wilenty's_Section", "Wilenty's_Key", "value_of_Wilenty")
$err = @error
ConsoleWrite( "$INI_memory: " & @CRLF & _IniGetMemory($INI_memory) & @CRLF)

ConsoleWrite( '-> $INI_memory = _IniRenameSection($INI_memory, "Wilenty''s_Section", "Section_of_Wilenty")' & @CRLF)
$INI_memory = _IniRenameSection($INI_memory, "Wilenty's_Section", "Section_of_Wilenty")
$err = @error
ConsoleWrite( "$INI_memory: " & @CRLF & _IniGetMemory($INI_memory) & @CRLF)

ConsoleWrite( '-> $INI_memory = _IniDeleteKey($INI_memory, "Section_of_Wilenty", "Wilenty''s_Key")' & @CRLF)
$INI_memory = _IniDeleteKey($INI_memory, "Section_of_Wilenty", "Wilenty's_Key")
$err = @error
ConsoleWrite( "$INI_memory: " & @CRLF & _IniGetMemory($INI_memory) & @CRLF)

ConsoleWrite( '-> $INI_memory = _IniSetValue($INI_memory, "Section_of_Wilenty", "Some_Key", "Some_Value")' & @CRLF)
$INI_memory = _IniSetValue($INI_memory, "Section_of_Wilenty", "Some_Key", "Some_Value")
$err = @error
ConsoleWrite( "$INI_memory: " & @CRLF & _IniGetMemory($INI_memory) & @CRLF)

ConsoleWrite( '-> $INI_memory = _IniDeleteSection($INI_memory, "Section_of_Wilenty")' & @CRLF)
$INI_memory = _IniDeleteSection($INI_memory, "Section_of_Wilenty")
$err = @error
ConsoleWrite( "$INI_memory: " & @CRLF & _IniGetMemory($INI_memory) & @CRLF)

ConsoleWrite( '+ Restore "' & _IniInternalEnumSections($Ini_section)[0] & '"' & @CRLF)
ConsoleWrite( '-> $INI_memory = _IniAddSection($INI_memory, $Ini_section)' & @CRLF)
$INI_memory = _IniAddSection($INI_memory, $Ini_section)
$err = @error
ConsoleWrite( "$INI_memory: " & @CRLF & _IniGetMemory( $INI_memory ) & @CRLF)

ConsoleWrite( '-> _IniInternalEnumSectionKeys($Ini_section)[0] & ": " & _IniGetValue($INI_memory, _IniInternalEnumSections($Ini_section)[0], _IniInternalEnumSectionKeys($Ini_section)[0], ":-(")' & @CRLF)
ConsoleWrite(  _IniInternalEnumSectionKeys($Ini_section)[0] & ": " & _IniGetValue($INI_memory, _IniInternalEnumSections($Ini_section)[0], _IniInternalEnumSectionKeys($Ini_section)[0], ":-(") & @CRLF & @CRLF )

ConsoleWrite( '-> $INI_memory = _IniDeleteSection($INI_memory, _IniInternalEnumSections($Ini_section)[0])' & @CRLF)
$INI_memory = _IniDeleteSection($INI_memory, _IniInternalEnumSections($Ini_section)[0])
$err = @error
ConsoleWrite( "$INI_memory: " & @CRLF & _IniGetMemory($INI_memory) & @CRLF)

ConsoleWrite( 'A nonsense example, but works:' & @CRLF )
ConsoleWrite( '-> _IniInternalEnumSectionKeys($INI_memory[0])[0] & ": " & _IniInternalGetKeyValue( _IniInternalGetSection($INI_memory[0], _IniInternalEnumSections($INI_memory[0])[0]), _IniInternalEnumSectionKeys($INI_memory[0])[0], ":-(")' & @CRLF)
ConsoleWrite(  _IniInternalEnumSectionKeys($INI_memory[0])[0] & ": " & _IniInternalGetKeyValue( _IniInternalGetSection($INI_memory[0], _IniInternalEnumSections($INI_memory[0])[0]), _IniInternalEnumSectionKeys($INI_memory[0])[0], ":-(") & @CRLF & @CRLF )

ConsoleWrite( '+ $INI_memory encoding as string is: ' & _IniGetEncodingString($INI_memory) & @CRLF & @CRLF)

ConsoleWrite( @CRLF & 'Timers: ' & TimerDiff($timer) & ' milliseconds, ' & Round(TimerDiff($timer)/1000, 3) & ' seconds' & @CRLF & @CRLF )

Exit $err
