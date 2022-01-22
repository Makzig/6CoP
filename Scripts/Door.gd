extends Area2D

var dialog = Dialogic.start("Открытие двери")
var open = false

export var Keys_needed = 1
#если включена то дверь горизонтальна
export (String , "Horisontal","Vertical") var X_and_Y = true
export var Button = false


func _ready():
	$Label.text = str(Keys_needed)
	if Button == true:
		$Label.queue_free()
		
		var butt = get_node("BlockButton")
		butt.connect("activated", self, "activated")


func _process(_delta):
	if X_and_Y == "Horisontal" and open == false:
		$AnimationPlayer.play("close")
		
	elif X_and_Y == "Vertical" and open == false:
		$AnimationPlayer.play("v_close")
		
	$AudioStreamPlayer2D.volume_db = Global.sound_volume


func _on_Door_body_entered(body):
	if body.is_in_group("Player"):
		if body.have_key >= Keys_needed and Button == false:
			if open == false:
					$StaticBody2D.queue_free()
					open = true
					$Label_area.queue_free()
					$Label.queue_free()
					$AudioStreamPlayer2D.play()
					$Timer.start()
					#add_child(dialog)
					
					
					if X_and_Y == "Horisontal":
						$AnimationPlayer.play("open")
					elif  X_and_Y == "Vertical":
						$AnimationPlayer.play("v_open")


func activated(x):
	if Button == true:
		open = x
	if open == true:
		$StaticBody2D.scale = Vector2(0, 0)
		$StaticBody2D.position = Vector2(16, 16)
		if X_and_Y == "Horisontal":
			$AnimationPlayer.play("open")
		if  X_and_Y == "Vertical":
			$AnimationPlayer.play("v_open")
		$AudioStreamPlayer2D.play()
		yield(get_tree().create_timer(1), "timeout")
		$AudioStreamPlayer2D.stop()
	elif open == false:
		$StaticBody2D.scale = Vector2(1, 1)
		$StaticBody2D.position = Vector2(0, 0)
		$AudioStreamPlayer2D.stop()

func _on_Timer_timeout():
	$AudioStreamPlayer2D.stop()


func _on_Label_area_body_entered(body):
	if body.is_in_group("Player") and Button == false:
		$Label2.play("Popup_show")
		$Label.visible = true


func _on_Label_area_body_exited(_body):
	if Button == false:
		$Label.visible = false
