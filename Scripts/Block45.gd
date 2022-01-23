extends KinematicBody2D


export (String , "Left_up", "Left_down", "Right_up", "Right_down", "All") var Edge = "All"


func _ready():
	if Edge == "All":
		$Down_left/CollisionPolygon2D2.disabled = false
		$Down_right/CollisionPolygon2D3.disabled = false
		$Up_Right/CollisionPolygon2D5.disabled = false
		$Up_left/CollisionPolygon2D4.disabled = false
		
		$Down_left/Sprite.visible = true
		$Down_right/Sprite2.visible = true
		$Up_left/Sprite.visible = true
		$Up_Right/Sprite2.visible = true
		
		
		
		
	if Edge == "Left_up":
		$Down_left/CollisionPolygon2D2.disabled = true
		$Down_right/CollisionPolygon2D3.disabled = true
		$Up_Right/CollisionPolygon2D5.disabled = true
		$Up_left/CollisionPolygon2D4.disabled = false
		
		$Down_left/Sprite.visible = false
		$Down_right/Sprite2.visible = false
		$Up_left/Sprite.visible = true
		$Up_Right/Sprite2.visible = false
	
		
		
	if Edge == "Left_down":
		$Down_left/CollisionPolygon2D2.disabled = false
		$Down_right/CollisionPolygon2D3.disabled = true
		$Up_Right/CollisionPolygon2D5.disabled = true
		$Up_left/CollisionPolygon2D4.disabled = true
		
		$Down_left/Sprite.visible = true
		$Down_right/Sprite2.visible = false
		$Up_left/Sprite.visible = false
		$Up_Right/Sprite2.visible = false
		

		
	if Edge == "Right_up":
		$Down_left/CollisionPolygon2D2.disabled = true
		$Down_right/CollisionPolygon2D3.disabled = true
		$Up_Right/CollisionPolygon2D5.disabled = false
		$Up_left/CollisionPolygon2D4.disabled = true
		
		$Down_left/Sprite.visible = false
		$Down_right/Sprite2.visible = false
		$Up_left/Sprite.visible = false
		$Up_Right/Sprite2.visible = true
		

		
	if Edge == "Right_down":
		$Down_left/CollisionPolygon2D2.disabled = true
		$Down_right/CollisionPolygon2D3.disabled = false
		$Up_Right/CollisionPolygon2D5.disabled = true
		$Up_left/CollisionPolygon2D4.disabled = true
		
		$Down_left/Sprite.visible = false
		$Down_right/Sprite2.visible = true
		$Up_left/Sprite.visible = false
		$Up_Right/Sprite2.visible = false
		

		
		
		

func _on_Down_left_area_entered(area):
	if area.is_in_group("Bul") :
		if area.rotation_degrees >= 0:
			area.rotation_degrees = 90
			area.velocity = area.velocity.rotated(area.rotation)
			
			
			
			
		if area.rotation_degrees <= 0:
			area.rotation_degrees = -90
			area.velocity = area.velocity.rotated(area.rotation)
			area.Rotation_Sprite -= 90


func _on_Up_left_area_entered(area):
	if area.is_in_group("Bul"):
		if area.rotation_degrees > 0:
			area.rotation_degrees -= 90
			area.Speed *= -1
			area.velocity = Vector2(0, area.Speed)  
			
		if area.rotation_degrees <= 0:
			area.rotation_degrees -= 180
			area.velocity =  Vector2(area.Speed, 0)  
			#area.velocity = area.velocity.rotated(area.rotation)
			area.Rotation_Sprite -= 0
			area.Rotation_particles -= 90

func _on_Up_Right_area_entered(area):
	if area.is_in_group("Bul"):
		if area.rotation_degrees > 0:
			area.rotation_degrees += 90 
			
			area.velocity = Vector2(area.Speed, 0)      
			#area.velocity.rotated(area.rotation)
			area.Rotation_Sprite = 180
			area.Rotation_particles += 90
			
			
		if area.rotation_degrees <= 0:
			area.rotation_degrees = 90
			area.velocity = area.velocity.rotated(area.rotation)
			area.Rotation_Sprite = -180
			area.Rotation_particles -= 180
			

func _on_Down_right_area_entered(area):
	if area.is_in_group("Bul"):
		if area.rotation_degrees >= 0:
			area.rotation_degrees += 90
			area.velocity = area.velocity.rotated(area.rotation)
			area.Rotation_Sprite += 90
			area.Rotation_particles -= 90
			
			
			
		if area.rotation_degrees < 0:
			area.rotation_degrees += 90
			area.velocity = area.velocity.rotated(area.rotation)
			area.Rotation_Sprite += 180
			area.Rotation_particles += 90
			
