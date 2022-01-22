extends KinematicBody2D

var pressed = false
export var Vector = Vector2()
var left = false
var right = false
var a = 1
export var Move_speed = 40





func _process(_delta):
# warning-ignore:return_value_discarded
	move_and_slide(Vector)







func _input(event):
	if event.is_action_pressed("left"):
		left = true
	elif event.is_action_released("left"):
		left = false
		
		
		
	if event.is_action_pressed("right"):
		right = true
		
	elif event.is_action_released("right"):
		right = false
		
		
		
		
		
	if event.is_action_pressed("Interaction"):
		pressed = true
		
	elif event.is_action_released("Interaction"):
		pressed = false

















func _on_Left_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Left_move")




func _on_Right_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Right_move")



func _on_Up_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Down_move")

func _on_Down_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Up_move")


















func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Boom_animation":
		queue_free()
		
		
	if anim_name == "Left_move" or anim_name == "Down_move" or anim_name == "Right_move" or anim_name == "Up_move":
		Vector.x = 0
		Vector.y = 0

func _on_HitBox_area_entered(area):
	if area.is_in_group("Enemy") or area.is_in_group("Boom"):
		$AnimationPlayer.play("Boom_animation")

