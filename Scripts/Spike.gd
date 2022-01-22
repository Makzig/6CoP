extends Area2D

#Активируется ли если на него наступил игрок или по таймеру
export var Detector = false
export var Offset = 0.01
export var Activation_every = 4.0
export var Attack_time = 1.0
export var Detector_delay = 1.0

#установка таймеров
func _ready():
	$OffTimer.wait_time = Offset
	$Timer.wait_time = Activation_every
	$OffTimer.start()

#запуск после задерки
func _on_OffTimer_timeout():
	$Timer.start()

#после таймера атаки
func _on_Timer_timeout():
	if Detector == false:
		$AnimationPlayer.play("Warning")
		yield(get_tree().create_timer(1.0), "timeout")
		attack()
#Если ДЕТЕКТОР
func _on_Spikes_body_entered(body):
	if body.is_in_group("Player"):
		if Detector == true:
			$AnimationPlayer.play("Warning")
			yield(get_tree().create_timer(Detector_delay), "timeout")
			attack()

func attack():
			$AnimationPlayer.play("Attack")
			$DamageArea2D/CollisionShape2D.disabled = false
			yield(get_tree().create_timer(Attack_time), "timeout")
			$AnimationPlayer.play("Idle")
			$DamageArea2D/CollisionShape2D.disabled = true
			$Timer.start()
			#$AudioStreamPlayer2D.play()
