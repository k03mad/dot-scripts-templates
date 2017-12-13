rem remove some temp dirs

for /d %%x in (
	C:\Temp D:\Temp %TMP% %TEMP% %SystemRoot%\Temp "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files"
) do (
	del %%x\* /F /Q
	for /d %%p in (%%x\*) do rd /Q /S "%%p"
)
