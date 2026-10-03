extends Button
func _ready()->void:
	pressed.connect(start)

func start()->void:
	get_tree().change_scene_to_file("res://scenes/lore/lore1.tscn")
