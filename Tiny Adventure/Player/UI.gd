extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("HP").max_value = Game.Player_Max_HP
	get_node("HP").value = Game.Player_HP
	
func _physics_process(delta):
	get_node("HP").value = Game.Player_HP
