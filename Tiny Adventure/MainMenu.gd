extends Node2D



func _ready():
	#uncomment if you want to change player
	#the character selection screen won't show the player you're actually selecting currently
	#Utils.save_game()
	Utils.load_game()
	
func _on_PlayBtn_pressed():
	if Game.FirstLaunch == false:
		StageManager.change_stage(StageManager.CharacterSelect)
	else:
		StageManager.change_stage(StageManager.MainWorld)


func _on_Quit_pressed():
	get_tree().quit()
