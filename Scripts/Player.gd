extends KinematicBody2D

#переменные для передвижения
var velocity = Vector2()
var slip = false

#скорость пердвижения
export var speed = 100
var slip_speed = Vector2(0, 0)


#для анимации
onready var anim_travel = $AnimationTree.get("parameters/playback")
onready var anim = $AnimationTree

#живой или нет
onready var lives = true

#наличие ключей
export var have_key = 0


#передвижение
func move():
	if lives == true:
		#управление
		#горизонтальное управление
		if Input.is_action_pressed("left"):
			velocity.x = -1
			anim_travel.travel("Left")
			
			
		elif Input.is_action_pressed("right"):
			velocity.x = 1
			anim_travel.travel("Right")
			
			
		else:
			velocity.x = 0
			
		#вертикальное
		if Input.is_action_pressed("up"):
			velocity.y = -1
			anim_travel.travel("Up")
			
			
		elif Input.is_action_pressed("down"):
			velocity.y = 1
			anim_travel.travel("Down")
			
			
		else:
			velocity.y = 0
		
		#Если касается стены и нажал кнопку движения
		if Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up") or Input.is_action_pressed("down"):
			if is_on_wall():
				slip_speed = velocity
		
	#проверка на жизни
	elif lives == false:
		velocity.x = 0
		velocity.y = 0
		$CollisionShape2D.disabled = true
		$AnimationPlayer.play("Dead")
		$CanvasLayer/Popup.show()


func _physics_process(_delta):
	restart()
	move()
	if slip == false or is_on_wall():
		move_and_slide(velocity.normalized() * speed)
	if slip == true and not is_on_wall():
		move_and_slide(slip_speed.normalized() * speed)
	
	if velocity == Vector2.ZERO or slip == true:
		anim_travel.travel("Idle")
	
	$Get_key.volume_db = Global.music_volume - 5
	
	print(Global.movey)
#Рестарт на R
func restart():
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		lives = true
		anim_travel.travel("Idle")


#сигналы для льда и врагов
func _on_HitBox_area_entered(area):
	#думаю и так понятно что это враги
	if area.is_in_group("Enemy"):
		lives = false
		$HitBox/Hit_collision.queue_free()
		if $Damage.playing == false:
			$Damage.play()
	
	
	
	#ключи
	if area.is_in_group("Keys"):
		have_key += 1
		$Get_key.play()
	#лёд
	if area.name == "Ice":
		slip = true
		slip_speed = velocity


func _on_HitBox_area_exited(area):
	if area.name == "Ice":
		slip = false

