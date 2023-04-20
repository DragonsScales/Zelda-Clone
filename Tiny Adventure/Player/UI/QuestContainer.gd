extends VBoxContainer

const IntroQuest = preload("res://Player/Quests/Quest.tscn")

func show_Quests():
	for x in get_child_count():
		get_child(x).queue_free()

	if Quests.IntroQuest:
		var quest1 = IntroQuest.instance()
		self.add_child(quest1)
