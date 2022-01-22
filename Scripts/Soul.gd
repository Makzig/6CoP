extends Area2D




func _on_Area2D_area_shape_entered(_area_id, area, _area_shape, _local_shape):
	if area.is_in_group("Player"):
			$AudioStreamPlayer2D.play()
			$Sprite.hide()
			


func _on_AudioStreamPlayer2D_finished():
	Global.movey += 1
	queue_free()


func _process(_delta):
	$AudioStreamPlayer2D.volume_db = Global.sound_volume
