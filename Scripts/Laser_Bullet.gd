extends Area2D

var Speed = 150
var velocity = Vector2(Speed, 0)

#движение вперёд
func _physics_process(_delta):
	position += velocity * _delta

#уничтожение пушки

func kill():
	$CollisionShape2D.set_deferred("disabled", true)
	yield(get_tree().create_timer(0.1), "timeout")
	queue_free()

#удаление по таймеру
func _on_Timer_timeout():
	kill()

#столкновение со стеной
func _on_Bullet_body_entered(body):
	if not(body.is_in_group("AllowBullets")):
		kill()

