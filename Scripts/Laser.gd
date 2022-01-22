extends StaticBody2D


onready var playback = $AnimationTree.get("parameters/playback")

export var Offset = 0.001
export var Reload = 1.0
export var Charging_time = 0.2
export var Len_of_shoot = 5.0
export var Rotation_Angle = 0.0


#активация
func _ready():
	$Timer.wait_time = Reload
	#через сколько начнёт стрелять пушка после старта сцены
	$OffTimer.wait_time = Offset
	$OffTimer.start()



#первый запуск лазера
func _on_OffTimer_timeout():
	$Timer.start()



#выстрел
func _on_Timer_timeout():
	$AnimationPlayer.play("Charging")
	
	
	yield(get_tree().create_timer(Charging_time), "timeout")
	
	$Sprite/RayCast2D.shoot(true)
	
	$Laser.play()
	
	$AnimationPlayer.play("Attack")
	
	yield(get_tree().create_timer(Len_of_shoot), "timeout")
	
	
	$Sprite/RayCast2D.shoot(false)
	
	
	$AnimationPlayer.play("idle")
	
	
	yield(get_tree().create_timer(0.2), "timeout")
	
	
	#поворот после выстрела
	$Sprite.rotation_degrees += Rotation_Angle
	$Timer.start()

func _process(delta):
	$Laser.volume_db = Global.sound_volume



