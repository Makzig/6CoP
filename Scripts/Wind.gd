extends Area2D

var speed = 400
var velocity = Vector2(speed, 0)

#движение вперёд
func _physics_process(delta):
	position += velocity * delta

