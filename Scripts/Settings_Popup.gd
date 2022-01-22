extends Control

export var black_sc = false


#полный экран
func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen

#назад
func _on_Back_pressed():
	$Popup.hide()
	
	
#Вертикальная синхронизация
func _on_Vsync_pressed():
	OS.vsync_enabled = !OS.vsync_enabled

#Настройка музыки
func _on_Music_scrolling():
	Global.music_volume = $Popup/VBoxContainer/Music.value

#настройка звуков
func _on_Sound_scrolling():
	Global.sound_volume = $Popup/VBoxContainer/Sound.value



func _on_Popup_about_to_show():
	if black_sc == true:
		$ColorRect.color = Color(0.0 , 0.0 , 0.0 , 100.0)



func _on_Popup_popup_hide():
	$Popup/ColorRect.visible = false
