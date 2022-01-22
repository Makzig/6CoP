extends StaticBody2D

export (String , "Horizontal", "Vertical")  var X_and_Y = "Horizontal"

export  (String , "Secret" , "Usely") var Type = "Usely"


func _on_Area2D_area_entered(area):
	if area.is_in_group("Boom") and Type == "Secret":
		queue_free()
	elif area.is_in_group("Bul") and Type == "Usely":
		queue_free()



func _ready():
	if X_and_Y == "Horizontal":
		$AnimationPlayer.play("Hirizontal")
	elif X_and_Y == "Vertical":
		$AnimationPlayer.play("Vertical")
