extends KinematicBody2D

export var moving = Vector2(0, 0)


func _physics_process(_delta):
# warning-ignore:return_value_discarded
	move_and_slide(moving)
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Down_move" or anim_name == "Left_move" or anim_name == "Up_move" or anim_name == "Right_move":
		moving.x = 0
		moving.y = 0


func _on_Left_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Left_move")


func _on_Right_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Right_move")


func _on_Up_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Up_move")


func _on_Down_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Down_move")
