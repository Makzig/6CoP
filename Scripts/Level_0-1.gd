extends Node2D


func button_pressed():
	$Wall/Canon._on_Timer_timeout()
	$Wall/Canon2._on_Timer_timeout()


func _on_Button_in_wall_button_pressed():
	button_pressed()
