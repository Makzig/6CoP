extends Control




func _on_Settings_pressed():
	$Settings_popup.show()
	$Settings_popup/Video_Box/Fullscreen.grab_focus()

func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen



func _input(event):
	if event.is_action_pressed("back"):
		$Settings_popup.hide()
		$Menu/Menu_label/Play.grab_focus()


func _ready():
	$Menu/Menu_label/Play.grab_focus()







func _on_Play_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/GUI/LevelMap.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Play_focus_entered():
	$Start_animation.play("Play_pressed")


func _on_Play_focus_exited():
	$Finished_animation.play("Play_focus_exit")

func _on_Settings_focus_entered():
	$Start_animation.play("Setting_focus")


func _on_Settings_focus_exited():
	$Finished_animation.play("Settings_Focus_exit")
	


func _on_Exit_focus_entered():
	$Start_animation.play("Exit_focus")


func _on_Exit_focus_exited():
	$Finished_animation.play("Exit_focus_exiting")


func _on_Levels_focus_entered():
	$Start_animation.play("Levels_focus")

func _on_Levels_focus_exited():
	$Finished_animation.play("Levels_focus_exit")
