extends Area2D

export var Time = 1.0
var entered = false

func _on_Detected_area_body_entered(body):
	if body.is_in_group("Player"): 
		$AnimationPlayer.play("Attack")
		$Timer.start()
		



func _on_Timer_timeout():
	$AnimationPlayer.play("After_attack")



func _ready():
	$Timer.wait_time = Time
