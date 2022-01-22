extends Position2D

var child = preload("res://Player.tscn")

func _ready():
	var baby = child.instance()
	add_child(baby)
