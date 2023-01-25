extends KinematicBody2D


export (int) var speed = 80


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
		show_Sprite("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		show_Sprite("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", input_vector)
		$AnimationTree.set("parameters/Walk/blend_position", input_vector)
		move_and_slide(input_vector*speed)
	
	pass

func show_Sprite(sprite_name):
	get_node("Idle").hide()
	get_node("Walk").hide()
	match sprite_name:
		"Idle":
			get_node("Idle").show()
		"Walk":
			get_node("Walk").show()
