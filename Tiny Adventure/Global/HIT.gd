extends Label

var travel = Vector2(0, -50)
var duration = 1
var spread = PI/2
var crit = false


func show_value(value, crit):
	text = value
	rect_pivot_offset = rect_size / 4
	
	var movement = travel.rotated(rand_range(-spread/2, spread/2))

	#Animate Position of label
	get_node("Tween").interpolate_property(self, "rect_position", rect_position, rect_position + movement, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	#Animate the fade-out, modulate:a just changes the color, a means alpha
	get_node("Tween").interpolate_property(self, "modulate:a", 1.0, 0.0, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	if crit == true:
		modulate = Color(1, 0, 0)
		get_node("Tween").interpolate_property(self, "rect_scale", rect_scale*2, rect_scale, 0.4, Tween.TRANS_BACK, Tween.EASE_IN)
		
	get_node("Tween").start()
	#He explains this horribly, but basically it stops Tween from being used until it's completed
	yield($Tween, "tween_all_completed")
	queue_free()
