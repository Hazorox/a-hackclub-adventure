extends Button

func _ready()->void:
	pressed.connect(restart)

func restart()->void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
