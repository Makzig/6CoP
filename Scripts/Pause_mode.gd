extends Control



#нажатие паузы
func _on_Pause_pressed():
	$Popup.show()
	
	get_tree().paused = true
	$Popup/VBoxContainer/Resume.grab_focus()


#продолжить
func _on_Resume_pressed():
	$Popup.hide()
	get_tree().paused = false


#выход
func _on_Exit_pressed():
	get_tree().change_scene("res://Scenes/GUI/Menu.tscn")
	get_tree().paused = false
#анимация кнопки паузы(при входе/выходе мышки)

#если навели мышкой
func _on_Pause_mouse_entered():
	$Pause.icon.region = Rect2(48.0, 64.0, 16.0, 16.0)
	
	
#если отвели мышкой
func _on_Pause_mouse_exited():
	$Pause.icon.region = Rect2(32.0, 64.0, 16.0, 16.0)

#настройки
func _on_Settings_pressed():
	pass


func _input(event):
	
	#при нажатии esc появляется пауза
	if event.is_action_pressed("pause"):
		#здесь если нет паузы то открывается меню
		if get_tree().paused == false:
			$Pause.emit_signal("pressed")
		#здесь наоборот, закрывается
		elif get_tree().paused == true:
			$Popup/VBoxContainer/Resume.emit_signal("pressed")


