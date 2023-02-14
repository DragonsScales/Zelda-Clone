extends KinematicBody2D

var speed = 30
var see_player = false
var direction = Vector2()

func _physics_process(delta):
	
	if see_player == true:
		#he adds this in, but it doesn't actually matter
		direction = Vector2.ZERO;
		
		var player = get_node("../../Friendly/Player")
		direction = (player.position - position).normalized()
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", direction)
		$AnimationTree.set("parameters/Walk/blend_position", direction)
		move_and_slide(speed*direction)
	else:
		$AnimationTree.get("parameters/playback").travel("Idle")
			
func _on_Player_Check_body_entered(body):
	if body.name == "Player":
		see_player = true



func _on_Player_Check_body_exited(body):
	if body.name == "Player":
		see_player = false
