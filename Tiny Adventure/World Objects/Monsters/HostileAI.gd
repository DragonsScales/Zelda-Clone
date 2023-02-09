extends KinematicBody2D

var speed = 30
var see_player = false
var direction = Vector2()

func _physics_process(delta):
	
	if see_player == true:
		var player = get_node("../../Friendly/Player")
		direction = (player.position - position).normalized()
		if direction.x < 0:
			get_node("AnimatedSprite").play("Walk Left")
		elif direction.x > 0:
			get_node("AnimatedSprite").play("Walk Right")
		move_and_slide(speed*direction)
	else:
		if direction.x < 0:
			get_node("AnimatedSprite").play("Idle Left")
		elif direction.x > 0:
			get_node("AnimatedSprite").play("Idle Right")
			
func _on_Player_Check_body_entered(body):
	if body.name == "Player":
		see_player = true



func _on_Player_Check_body_exited(body):
	if body.name == "Player":
		see_player = false
