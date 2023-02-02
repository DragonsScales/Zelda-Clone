extends Node2D


func _read():
	Utils.load_game()
	
func _on_PlayBtn_pressed():
	if Game.FirstLaunch == false:
		get_tree().change_scene("res://CharacterSelect.tscn");
	else:
		get_tree().change_scene("res://World.tscn")
