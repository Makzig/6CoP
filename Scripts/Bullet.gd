extends Area2D

var Speed = 0
var velocity = Vector2(0, 0)
var Rotation_Sprite = 0.0
var Rotation_particles = 90.0
export var Bullet_life = 4.0 
#export (String , "Bullet", "Laser") var type = "Bullet"

var type = true

func _ready():
	velocity = Vector2(Speed, 0)
	$Timer.wait_time = Bullet_life




#движение вперёд
func _physics_process(delta):
	position += velocity * delta
	$CollisionShape2D/Sprite.rotation_degrees = Rotation_Sprite
	$Particles2D.rotation_degrees = Rotation_particles
	
	
	
	
	
	if Speed <= 300 and Speed >= -300:
		$AnimationPlayer.play("Bullet")
		
		
		
	elif Speed >= 300 or Speed <= -300:
		$AnimationPlayer.play("Laser")
		$Particles2D.emitting = false
		

#уничтожение пушки
func kill():
	$CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D/Sprite.visible = false
	yield(get_tree().create_timer(0.2), "timeout")
	queue_free()



#удаление по таймеру
func _on_Timer_timeout():
	kill()

#столкновение со стеной
func _on_Bullet_body_entered(body):
	if not(body.is_in_group("AllowBullets")) and not(body.is_in_group("Player")):
		kill()

