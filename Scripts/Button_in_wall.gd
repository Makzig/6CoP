extends StaticBody2D


export  (String , "Up", "Right", "Left", "Down") var Look = "Up"

signal button_pressed 

export (String, "Player", "Rock") var area_button = "Rock"

func _ready():
	if Look == "Up":
		$Area2D.rotation_degrees = 180
	if Look == "Right":
		$Area2D.rotation_degrees = -90
	if Look == "Left":
		$Area2D.rotation_degrees = 90
	if Look == "Down":
		$Area2D.rotation_degrees = 0







func _on_Area2D_area_entered(area):
	if area_button == "Rock" and area.is_in_group("Block"):
		emit_signal("button_pressed")
		print("Ha")



	elif area_button == "Player" and area.is_in_group("Player"):
		emit_signal("button_pressed")
		print("Player")
