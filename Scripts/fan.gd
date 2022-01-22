extends StaticBody2D

export var Wind_Blocks = 5
export var Wind_Speed = 1.0
var winded = false
var Body
var wind = Vector2(0, 0)

func _ready():
	$WindArea/CollisionShape2D.scale.x = Wind_Blocks 
	$WindArea/CollisionShape2D2.scale.x = Wind_Blocks
	$WindArea/CollisionShape2D3.scale.x = Wind_Blocks 
	$Particles2D.lifetime = 0.4 * Wind_Blocks
	wind = Vector2(cos(global_rotation), sin(global_rotation))

func _physics_process(_delta):
	if winded == true:
		Body.position += wind * Wind_Speed

func _on_WindArea_body_entered(body):
	if body.is_in_group("Player"):
		yield(get_tree().create_timer(0.001), "timeout")
		Body = body
		winded = true


func _on_WindArea_body_exited(body):
		if body.is_in_group("Player"):
			winded = false


func _process(_delta):
	$AudioStreamPlayer2D.volume_db = Global.sound_volume -20
