extends StaticBody2D

var bullet = preload("res://Scenes/Barrier/Bullet.tscn")
export (String , "Laser", "Canon") var Type = "Canon"


signal shoot(bullet)

export var Bullet_life = 4.0
export var Rotation_Gun_Ready = 90
export var Offset = 0.001
export var Reload_speed = 4.0
export var Rotation_Angle = 0.0
export var Bullet_Speed = 100
export var Off_timer_start = true
#var n = 1
#export var Shooting = true 
#активация

var type_bullet = true


func _ready():
	if Type == "Laser":
		type_bullet = false
		$AnimationPlayer.play("Laser")
	elif Type == "Canon":
		type_bullet = true
		$AnimationPlayer.play("RESET")
	
	
	
	
	#как часто стреляет пушка
	$Timer.wait_time = Reload_speed
	#через сколько начнёт стрелять пушка после старта сцены
	$OffTimer.wait_time = Offset
	$Sprite.rotation_degrees = Rotation_Gun_Ready
	if Off_timer_start == true:
		$OffTimer.start()



func _on_Timer_timeout():
	
	#появление пули
	$Timer.start()
	emit_signal("shoot", bullet)
	$Gun.play()
	$Sprite.rotation_degrees += Rotation_Angle
	if Type == "Laser":
		$AnimationPlayer.play("Laser_attack")
	else:
		$AnimationPlayer.play("RESET")


#выстрел из пушки
# warning-ignore:shadowed_variable
func _on_Canon_shoot(bullet):
	var b = bullet.instance()
	
	
	
	b.Bullet_life = Bullet_life
	b.Speed = Bullet_Speed
	get_parent().add_child(b)
	b.rotation = $Sprite.rotation
	b.position = $Sprite/Position2D.global_position 
	b.velocity = b.velocity.rotated($Sprite.rotation)
	

	
	



#активация пушки после таймера задержки
func _on_OffTimer_timeout():
	$Timer.start()




#звук для пушки
func _process(_delta):
	$Gun.volume_db = Global.sound_volume * 0.01
	#if n == 1 and Shooting == true:
		#emit_signal("shoot")
		#n = 0
