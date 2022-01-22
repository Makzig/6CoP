extends Control



func _ready():
	$Button.grab_focus()

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level_0-1.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level_0-2.tscn")


func _on_Button3_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level_0-3.tscn")


func _on_Button4_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level_0-4.tscn")


func _on_Button5_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level_0-5.tscn")


func _on_Button6_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level 1-1.tscn")
