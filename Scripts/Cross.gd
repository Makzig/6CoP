extends Area2D

#для анимации
export var Rotation_Speed = 1.0


func _process(_delta):
	rotation_degrees += Rotation_Speed * 0.1
