extends Area2D

export var speed = 1.0
export var Time = 2.0 
export var Distance = 150
export var Distance_minus = -150

export (String , "X_Direction", "Y_Direction") var Direction_XY = "X_Direction"
var Direction = Vector2(1, 0)
var move = true
var distance_a = 0


var n = 1



signal stop



func _process(_delta):
	
	#Переменная движения
	if move == true:
		if Direction_XY == "X_Direction":
			position.x += (Direction.x * speed)
			distance_a += (speed * Direction.x)
			
		if Direction_XY == "Y_Direction":
			position.y += (Direction.y * speed)
			distance_a += (speed * Direction.y)
	#если она false значит пила стоит

	
	
	#здесь костыль ввиде переменной которая позволяет выпольнить функцию 1 раз , а не каждый кадр
	if n == 1 and (distance_a >= Distance or distance_a <= Distance_minus):
		n = 0
		emit_signal("stop")
		move = false



#Таймер который позволяет двигаться и выполнить функцию
func _on_Timer_timeout():
	move = true
	n = 1



#А это сигнал который меняет направление и запускает таймер(Состояние покоя)
func _on_Saw_stop():
		move = false
		
		$Timer.start()
		
		Direction.x *= -1
		Direction.y *= -1



func _ready():
	$Timer.wait_time = Time
	if Direction_XY == "X_Direction":
		Direction.y = 0
		Direction.x = 1
	elif Direction_XY == "Y_Direction":
		Direction.y = 1
		Direction.x = 0
