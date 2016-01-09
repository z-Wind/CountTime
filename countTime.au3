
Local $intervalTime = InputBox("間隔時間", "單位 秒", 5)
If @error > 0 Then
	Exit
EndIf
Local $times = InputBox("組數", "單位 組", 20)
If @error > 0 Then
	Exit
EndIf
Local $hwnd = SplashTextOn("提醒", "", 300, 150, -1, -1, -1, "", 30)
For $i = 1 To $times
	SoundPlay(@ScriptDir & "\LASER.wav", 1)
	For $j = $intervalTime To 1 Step -1
		WinSetTitle ( $hwnd, "", "提醒 目前組數 " & $i )
		ControlSetText($hwnd, "", "Static1", "開始"& @CRLF & "倒數 " & $j & " 秒" & @CRLF & "完成組數 " & $i-1)
		Sleep(1000)
	Next
	WinSetTitle ( $hwnd, "", "提醒 目前組數 " & $i )
	ControlSetText($hwnd, "", "Static1", "開始"& @CRLF & "倒數 0 秒" & @CRLF & "完成組數 "  & $i-1)
	SoundPlay(@ScriptDir & "\captcha.wav", 1)

	For $j = $intervalTime To 1 Step -1
		WinSetTitle ( $hwnd, "", "提醒 目前組數 " & $i )
		ControlSetText($hwnd, "", "Static1", "休息"& @CRLF & "倒數 " & $j & " 秒" & @CRLF & "完成組數 "  & $i-1)
		Sleep(1000)
	Next
	WinSetTitle ( $hwnd, "", "提醒 目前組數 " & $i )
	ControlSetText($hwnd, "", "Static1", "休息"& @CRLF & "倒數 0 秒" & @CRLF & "完成組數 "  & $i-1)
Next

SplashOff()
SoundPlay(@ScriptDir & "\pluck-pcm32.wav", 1)
MsgBox(0,"提醒","已完成 " & $times & " 組")